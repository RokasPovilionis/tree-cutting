# frozen_string_literal: true

# Controller for maps
class MapsController < ApplicationController
  def index
    @galiojimo_pradzia = params
  end

  def create
    puts('triggered create')

    create_geo_json

    redirect_to maps_path
  end

  private

  def create_geo_json
    puts 'Getting data for all the leidimai'
    leidimai = Leidimas.where(galiojimo_pradzia: 6.months.ago..DateTime.now).where(map_params)
    leidimai_count = leidimai.count
    current_nr = 0
    final_sklypas = nil
    multi_factory = RGeo::Geos.factory(srid: 4326)

    uredijos = Uredija.where(pavadinimas: leidimai.pluck(:uredija).uniq
      .map { |uredija| uredija.remove(' miškų').strip })

    pavadinimas_to_mu_kod = uredijos.each_with_object({}) do |uredija, hash|
      hash[uredija.pavadinimas] = uredija.mu_kod
    end

    pavadinimas_to_gir_kod = uredijos.each_with_object({}) do |uredija, hash|
      hash[uredija.pavadinimas] = uredija.girininkijos.each_with_object({}) do |girininkija, u_pavad|
        u_pavad[girininkija.pavadinimas] = girininkija.gir_kod
      end
    end

    leidimai.each do |leidimas|
      puts "Creating feature for leidimas nr #{leidimas.serija_ir_nr} #{current_nr} / #{leidimai_count}"

      sklypai = Sklypas.where(
        mu_kod: pavadinimas_to_mu_kod[leidimas.uredija.remove(' miškų').strip],
        gir_kod: pavadinimas_to_gir_kod.dig(leidimas.uredija.remove(' miškų').strip, leidimas.girininkija),
        kv_nr: leidimas.kvartalas,
        skl_nr: leidimas.sklypai.split
      )
      if sklypai.length.zero?
        sklypai = Sklypas.where(
          mu_kod: pavadinimas_to_mu_kod[leidimas.uredija.remove(' miškų').strip],
          gir_kod: pavadinimas_to_gir_kod.dig(leidimas.uredija.remove(' miškų').strip, leidimas.girininkija),
          kv_nr: leidimas.kvartalas,
          skl_nr: leidimas.sklypai.split.map(&:to_i)
        )
      end

      sklypai&.each do |sklypas|
        final_sklypas = if !final_sklypas
                          sklypas&.geom
                        elsif sklypas
                          final_sklypas.union(sklypas.geom)
                        end
      end

      current_nr += 1
    end

    if final_sklypas.nil?
      File.open('public/sklypai_with_leidimai.json', 'w') { |file| file.write {} }

      return nil
    end

    puts "Original geometry type is #{final_sklypas&.geometry_type}"

    multi_final_sklypas = if final_sklypas.geometry_type.type_name == 'MultiPolygon'
                            final_sklypas
                          else
                            multi_factory.multi_polygon([final_sklypas])
                          end

    factory = RGeo::GeoJSON::EntityFactory.instance

    feature = factory.feature multi_final_sklypas
    puts 'Generating hash'
    hash = RGeo::GeoJSON.encode feature
    puts 'Writing JSON file'
    File.open('public/sklypai_with_leidimai.json', 'w') { |file| file.write hash.to_json }
  end

  def map_params
    params.permit(:uredija, :kirtimo_rusis, :nuosavybes_forma)
  end
end

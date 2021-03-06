# frozen_string_literal: true

# Controller for maps
class MapsController < ApplicationController
  def index; end

  def create
    create_geo_json unless File.exist?(geo_json_location)
  end

  def map_params
    params.permit(uredija: [], kirtimo_rusis: [], nuosavybes_forma: [])
          .reject { |_, v| v.is_a?(Array) && v.include?('') }
  end

  def geo_json_location
    json = "public/geo_jsons/sklypai_with_leidimai_#{map_params.to_s.parameterize(separator: '_')}"

    json += "_galiojimo_pradzia_#{galiojimo_pradzia_nuo}" if galiojimo_pradzia_nuo

    json += "_galiojimo_pradzia_#{galiojimo_pradzia_iki}" if galiojimo_pradzia_iki

    json += "_galiojimo_pabaiga_#{galiojimo_pabaiga_nuo}" if galiojimo_pabaiga_nuo

    json += "_galiojimo_pabaiga_#{galiojimo_pabaiga_iki}" if galiojimo_pabaiga_iki

    json + '.json'
  end

  def galiojimo_pradzia_nuo
    @galiojimo_pradzia_nuo = DateTime.new(
      galiojimo_params['galiojimo_pradzia_nuo(1i)'].to_i,
      galiojimo_params['galiojimo_pradzia_nuo(2i)'].to_i,
      galiojimo_params['galiojimo_pradzia_nuo(3i)'].to_i
    )
  rescue ArgumentError
    @galiojimo_pradzia_nuo = nil
  end

  def galiojimo_pradzia_iki
    @galiojimo_pradzia_iki = DateTime.new(
      galiojimo_params['galiojimo_pradzia_iki(1i)'].to_i,
      galiojimo_params['galiojimo_pradzia_iki(2i)'].to_i,
      galiojimo_params['galiojimo_pradzia_iki(3i)'].to_i
    )
  rescue ArgumentError
    @galiojimo_pradzia_iki = nil
  end

  def galiojimo_pabaiga_nuo
    @galiojimo_pabaiga_nuo = DateTime.new(
      galiojimo_params['galiojimo_pabaiga_nuo(1i)'].to_i,
      galiojimo_params['galiojimo_pabaiga_nuo(2i)'].to_i,
      galiojimo_params['galiojimo_pabaiga_nuo(3i)'].to_i
    )
  rescue ArgumentError
    @galiojimo_pabaiga_nuo = nil
  end

  def galiojimo_pabaiga_iki
    @galiojimo_pabaiga_iki = DateTime.new(
      galiojimo_params['galiojimo_pabaiga_iki(1i)'].to_i,
      galiojimo_params['galiojimo_pabaiga_iki(2i)'].to_i,
      galiojimo_params['galiojimo_pabaiga_iki(3i)'].to_i
    )
  rescue ArgumentError
    @galiojimo_pabaiga_iki = nil
  end

  private

  def create_geo_json
    puts 'Getting data for all the leidimai'
    leidimai = Leidimas.where(map_params)
    leidimai = leidimai.where('? < galiojimo_pradzia', galiojimo_pradzia_nuo) if galiojimo_pradzia_nuo
    leidimai = leidimai.where('galiojimo_pradzia < ?', galiojimo_pradzia_iki) if galiojimo_pradzia_iki
    leidimai = leidimai.where('? < galiojimo_pabaiga', galiojimo_pabaiga_nuo) if galiojimo_pabaiga_nuo
    leidimai = leidimai.where('galiojimo_pabaiga < ?', galiojimo_pabaiga_iki) if galiojimo_pabaiga_iki

    leidimai_count = leidimai.count
    current_nr = 0
    final_sklypas = nil
    multi_factory = RGeo::Geos.factory(srid: 4326)

    uredijos = Uredija.where(pavadinimas: leidimai.pluck(:uredija).uniq
      .map { |uredija| uredija.remove(' mi??k??').strip })

    leidimai.each do |leidimas|
      puts "Creating feature for leidimas nr #{leidimas.serija_ir_nr} #{current_nr} / #{leidimai_count}"

      sklypai = leidimo_sklypai(leidimas, uredijos, leidimas.sklypai.split)

      sklypai = leidimo_sklypai(leidimas, uredijos, leidimas.sklypai.split.map(&:to_i)) if sklypai.length.zero?

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

    File.open(geo_json_location, 'w') { |file| file.write hash.to_json }
  end

  def leidimo_sklypai(leidimas, uredijos, sklypo_numeriai)
    Sklypas.where(
      mu_kod: pavadinimas_to_mu_kod(uredijos)[leidimas.uredija.remove(' mi??k??').strip],
      gir_kod: pavadinimas_to_gir_kod(uredijos).dig(leidimas.uredija.remove(' mi??k??').strip, leidimas.girininkija),
      kv_nr: leidimas.kvartalas,
      skl_nr: sklypo_numeriai
    )
  end

  def pavadinimas_to_mu_kod(uredijos)
    @pavadinimas_to_mu_kod ||= uredijos.each_with_object({}) do |uredija, hash|
      hash[uredija.pavadinimas] = uredija.mu_kod
    end
  end

  def pavadinimas_to_gir_kod(uredijos)
    @pavadinimas_to_gir_kod ||= uredijos.each_with_object({}) do |uredija, hash|
      hash[uredija.pavadinimas] = uredija.girininkijos.each_with_object({}) do |girininkija, u_pavad|
        u_pavad[girininkija.pavadinimas] = girininkija.gir_kod
      end
    end
  end

  def galiojimo_params
    params.permit('galiojimo_pradzia_nuo(1i)', 'galiojimo_pradzia_nuo(2i)', 'galiojimo_pradzia_nuo(3i)',
                  'galiojimo_pradzia_iki(1i)', 'galiojimo_pradzia_iki(2i)', 'galiojimo_pradzia_iki(3i)',
                  'galiojimo_pabaiga_nuo(1i)', 'galiojimo_pabaiga_nuo(2i)', 'galiojimo_pabaiga_nuo(3i)',
                  'galiojimo_pabaiga_iki(1i)', 'galiojimo_pabaiga_iki(2i)', 'galiojimo_pabaiga_iki(3i)')
  end
end

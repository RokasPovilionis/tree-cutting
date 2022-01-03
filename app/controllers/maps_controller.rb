class MapsController < ApplicationController
  def index
    @galiojimo_pradzia = params
  end

  def create
    puts('triggered create')

    # binding.pry

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

    leidimai.each do |leidimas|
      puts "Creating feature for leidimas nr #{leidimas.serija_ir_nr} #{current_nr} / #{leidimai_count}"
      sklypai = Uredija&.find_by(pavadinimas: leidimas.uredija.remove(' miškų').strip)&.girininkijos
                       &.find_by(pavadinimas: leidimas.girininkija)&.kvartalai
                       &.find_by(kv_nr: leidimas.kvartalas)&.sklypai
                       &.where(skl_nr: leidimas.sklypai.split.map(&:to_i))

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

    if final_sklypas.geometry_type.type_name == 'MultiPolygon'
      puts ' ++++ it is MultiPolygon'
      multi_final_sklypas = final_sklypas
    else
      puts ' ---- it is not MultiPolygon'
      multi_final_sklypas = multi_factory.multi_polygon([final_sklypas])
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

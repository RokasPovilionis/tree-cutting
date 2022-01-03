# frozen_string_literal: true

namespace :google_maps_json do
  desc 'creates json for Sklypai in leidimai'
  task create_sklypai_json: :environment do
    require 'rgeo'

    puts 'Getting data for all the leidimai'
    leidimai_count = Leidimas.where(galiojimo_pradzia: 6.months.ago..DateTime.now).count
    current_nr = 0
    final_sklypas = nil
    multi_factory = RGeo::Geos.factory(srid: 4326)

    Leidimas.where(galiojimo_pradzia: 6.months.ago..DateTime.now).each do |leidimas|
      puts "Creating feature for leidimas nr #{leidimas.serija_ir_nr} #{current_nr} / #{leidimai_count}"
      sklypai = Girininkija.find_by(pavadinimas: leidimas.girininkija)&.kvartalai
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

    puts "Original geometry type is #{final_sklypas.geometry_type}"

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
end

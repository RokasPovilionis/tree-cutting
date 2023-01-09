# frozen_string_literal: true

# Class used to generate geo json for cutting permit vizualization
class GeoJson::Generate
  include Interactor::Initializer

  initialize_with :leidimai, :geo_json_location

  def run
    generate_geo_json
  end

  private

  def generate_geo_json
    final_sklypas = nil
    multi_factory = RGeo::Geos.factory(srid: 4326)

    plot_ids = PermitPlot.where(permit_id: leidimai.ids).pluck(:plot_id)
    sklypai = Sklypas.where(id: plot_ids)

    current_nr = 0
    sklypai_count = sklypai.count

    sklypai&.each do |sklypas|
      final_sklypas = if !final_sklypas
                        sklypas&.geom
                      elsif sklypas
                        final_sklypas.union(sklypas.geom)
                      end
      puts "Sklypai #{current_nr} / #{sklypai_count}"

      current_nr += 1
    end

    return nil if final_sklypas.nil?

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

    File.write(geo_json_location, hash.to_json)
  end
end

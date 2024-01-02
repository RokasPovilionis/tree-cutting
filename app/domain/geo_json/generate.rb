# frozen_string_literal: true

# Class used to generate geo json for cutting permit vizualization
class GeoJson::Generate
  include Interactor::Initializer

  initialize_with :leidimai, :geo_json_location, :protected_area_name

  def run
    @combined_plot_count = 0
    @plots_count = plot_geoms.count

    generate_geo_json
  end

  private

  def generate_geo_json
    factory = RGeo::GeoJSON::EntityFactory.instance

    feature = factory.feature(combined_plot_multi_polygon)

    hash = RGeo::GeoJSON.encode feature

    File.write(geo_json_location, hash.to_json)
  end

  def combined_plots
    @combined_plots ||=
      plot_geoms.reduce do |combined_geoms, plot_geom|
        puts "plots #{@combined_plot_count += 1} / #{@plots_count}"

        combined_geoms.union(plot_geom)
      rescue RGeo::Error::InvalidGeometry
        combined_geoms
      end
  end

  def combined_plot_multi_polygon
    return combined_plots if combined_plots.geometry_type.type_name == 'MultiPolygon'

    RGeo::Geos.factory(srid: 4326).multi_polygon([combined_plots])
  end

  def plot_geoms
    @plot_geoms ||= GeoJson::GetPlotGeoms.for(leidimai, protected_area_name)
  end
end

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
    geojson_feature_collection = RGeo::GeoJSON::FeatureCollection.new(combined_plots)

    geojson = RGeo::GeoJSON.encode(geojson_feature_collection)

    File.write(geo_json_location, geojson.to_json)
  end

  def combined_plots
    @combined_plots ||=
      plot_geoms.map do |geom|
        puts "plots #{@combined_plot_count += 1} / #{@plots_count}"

        RGeo::GeoJSON::Feature.new(geom)
      end
  end

  def plot_geoms
    @plot_geoms ||= GeoJson::GetPlotGeoms.for(leidimai, protected_area_name)
  end
end

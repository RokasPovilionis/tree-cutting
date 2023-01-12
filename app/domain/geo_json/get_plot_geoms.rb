# frozen_string_literal: true

# Class used to get plot geomes needed for cutting permit vizualization
class GeoJson::GetPlotGeoms
  include Interactor::Initializer

  initialize_with :leidimai, :protected_area_name

  def run
    protected_area_name ? intersecting_plot_geoms : plot_geoms
  end

  private

  def plot_ids
    PermitPlot.where(permit_id: leidimai.ids).pluck(:plot_id)
  end

  def plot_geoms
    Sklypas.where(id: plot_ids).pluck(:geom).compact
  end

  def protected_area_model
    GeoJson::Constants::PROTECTED_AREA_NAME_TO_MODEL[protected_area_name]
  end

  def intersecting_plot_geoms
    protected_area_model.all.pluck(:geom).flat_map do |protected_area_geom|
      Sklypas
        .where(id: plot_ids).where(Sklypas.arel_table[:geom].st_intersects(protected_area_geom))
        .pluck(:geom)
        .compact
    end
  end
end

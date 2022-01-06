# frozen_string_literal: true

# Helper for maps
module MapsHelper
  def kirtimo_tipai
    Leidimas.distinct.pluck(:kirtimo_rusis).sort
  end

  def nuosavybes_formos
    Leidimas.distinct.pluck(:nuosavybes_forma).sort
  end

  def uredijos
    Leidimas.distinct.pluck(:uredija).sort.reject(&:empty?)
  end

  def map_params
    controller.map_params
  end

  def geo_json_location
    controller.geo_json_location.split('/').last(2).join('/')
  end
end

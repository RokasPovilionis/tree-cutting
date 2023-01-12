# frozen_string_literal: true

# Helper for maps
module MapsHelper
  PROTECTED_TERITORIES_MODELS =
    [
      'Natura2000 BAST',
      'Natura2000 PAST',
      'Rezervatas',
      'Draustinis',
      'Geologiniai Gpo',
      'Hidrografiniai Gpo',
      'Geomorfologiniai Gpo',
      'Hidrogeologiniai Gpo',
      'Botaniniai Gpo',
      'Zoologiniai Gpo',
      'STK Sklypai',
      'STK Parkai',
      'Biosferos Rezervatai',
      'Biosferos Poligonai',
      'Funkcinio Prioriteto Zonos',
      'Buferines Apsaugos Zonos'
    ].freeze

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

  def protected_area_models
    PROTECTED_TERITORIES_MODELS
  end
end

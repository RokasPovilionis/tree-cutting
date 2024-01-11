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
    Leidimas.distinct.pluck(:uredija).compact.sort.reject(&:empty?)
  end

  def galiojimas_pradzia_start_year
    Leidimas.minimum(:galiojimo_pradzia).year
  end

  def galiojimas_pradzia_end_year
    Leidimas.maximum(:galiojimo_pradzia).year
  end

  def galiojimas_pabaiga_start_year
    Leidimas.minimum(:galiojimo_pabaiga).year
  end

  def galiojimas_pabaiga_end_year
    Leidimas.maximum(:galiojimo_pabaiga).year
  end

  def map_params
    controller.map_params
  end

  def geo_json_location
    controller.geo_json_location.split('/').last(2).join('/')
  end

  def protected_area_models
    GeoJson::Constants::PROTECTED_AREA_NAME_TO_MODEL.keys
  end

  def extract_date(params, field_name)
    year = params["[#{field_name}(1i)]"]
    month = params["[#{field_name}(2i)]"]
    day = params["[#{field_name}(3i)]"]

    date_components = {}
    date_components[:year] = year.to_i if year.present?
    date_components[:month] = month.to_i if month.present?
    date_components[:day] = day.to_i if day.present?

    date_components
  end
end

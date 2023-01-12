# frozen_string_literal: true

# Controller for maps
class MapsController < ApplicationController
  def index; end

  def create
    GeoJson::Generate.for(leidimai, geo_json_location, protected_area_name) unless File.exist?(geo_json_location)
  end

  def map_params
    @map_params =
      params.permit(:saugoma_teritorija, uredija: [], kirtimo_rusis: [], nuosavybes_forma: [])
            .reject { |_key, value| value == [''] }
  end

  def geo_json_location
    json = "public/geo_jsons/sklypai_with_leidimai_#{map_params.to_s.parameterize(separator: '_')}"

    json += "_galiojimo_pradzia_#{galiojimo_pradzia_nuo}" if galiojimo_pradzia_nuo

    json += "_galiojimo_pradzia_#{galiojimo_pradzia_iki}" if galiojimo_pradzia_iki

    json += "_galiojimo_pabaiga_#{galiojimo_pabaiga_nuo}" if galiojimo_pabaiga_nuo

    json += "_galiojimo_pabaiga_#{galiojimo_pabaiga_iki}" if galiojimo_pabaiga_iki

    "#{json}.json"
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

  def protected_area_name
    return if map_params['saugoma_teritorija'] == ''

    map_params['saugoma_teritorija']
  end

  def leidimai
    leidimai = Leidimas.where(map_params.except('saugoma_teritorija'))
    leidimai = leidimai.where('? < galiojimo_pradzia', galiojimo_pradzia_nuo) if galiojimo_pradzia_nuo
    leidimai = leidimai.where('galiojimo_pradzia < ?', galiojimo_pradzia_iki) if galiojimo_pradzia_iki
    leidimai = leidimai.where('? < galiojimo_pabaiga', galiojimo_pabaiga_nuo) if galiojimo_pabaiga_nuo
    leidimai = leidimai.where('galiojimo_pabaiga < ?', galiojimo_pabaiga_iki) if galiojimo_pabaiga_iki

    leidimai
  end

  def galiojimo_params
    params.permit('galiojimo_pradzia_nuo(1i)', 'galiojimo_pradzia_nuo(2i)', 'galiojimo_pradzia_nuo(3i)',
                  'galiojimo_pradzia_iki(1i)', 'galiojimo_pradzia_iki(2i)', 'galiojimo_pradzia_iki(3i)',
                  'galiojimo_pabaiga_nuo(1i)', 'galiojimo_pabaiga_nuo(2i)', 'galiojimo_pabaiga_nuo(3i)',
                  'galiojimo_pabaiga_iki(1i)', 'galiojimo_pabaiga_iki(2i)', 'galiojimo_pabaiga_iki(3i)')
  end
end

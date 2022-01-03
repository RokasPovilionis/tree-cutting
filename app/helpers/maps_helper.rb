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
end

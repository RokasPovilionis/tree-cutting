# frozen_string_literal: true

# Helper for leidimai
module LeidimaiHelper
  KEY_MAPPING = {
    'kirtimo_rusis' => 'kirtimo rūšis',
    'galiojimo_pradzia' => 'galiojimo pradžia'
  }.freeze

  def leidimas_params_for_display(leidimas)
    leidimas.slice(
      'serija_ir_nr',
      'regionas',
      'rajonas',
      'nuosavybes_forma',
      'uredija',
      'girininkija',
      'kvartalas',
      'sklypai',
      'kirtimo_rusis',
      'galiojimo_pradzia',
      'galiojimo_pabaiga'
    ).transform_keys { |key| KEY_MAPPING.key?(key) ? KEY_MAPPING[key] : key }
  end
end

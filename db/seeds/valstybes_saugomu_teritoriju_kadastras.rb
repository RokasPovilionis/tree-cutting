# frozen_string_literal: true

REZERVATAI_SHP_COLUMN_NAME_TO_FULL_NAME = {
  'id' => 'id_kodas',
  'steig_tiks' => 'steig_tikslas',
  'id_registr' => 'id_registratorius_reg',
  'id_regis00' => 'id_registratorius_kor',
  'tarpt_svar' => 'tarptautinis_svarbos_statusas',
  'tarpt_sv00' => 'tarptautinis_svarbos_aprasymas',
  'gamtiniai_' => 'gamtiniai_kompleksai',
  'buf_zona_a' => 'buferines_zonos_aprasymas',
  'tvarkymo_z' => 'tvarkymo_zonos_aprasymas',
  'planavimo_' => 'planavimo_dokumentu_aprasymas',
  'eng_rezerv' => 'eng_rezervato_pobudis',
  'eng_steige' => 'eng_steigejas',
  'eng_steig_' => 'eng_steig_tikslas',
  'eng_tarpt_' => 'eng_tarptautines_svarbos_statusas',
  'eng_tarp00' => 'eng_tarptautines_svarbos_aprasymas',
  'eng_gamtin' => 'eng_gamtiniai_kompleksai',
  'eng_pastab' => 'eng_pastabos',
  'steigejas_' => 'steigejas_galiojantis',
  'steig_da00' => 'steig_data_galiojantis',
  'steig_ta_g' => 'steig_ta_galiojantis'
}.freeze

if Rezervatas.all.count.zero?

  puts 'seeding STK rezervatai'

  RGeo::Shapefile::Reader.open("#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Rezervatai.shp") do |file|
    puts "File contains #{file.num_records} records."
    values = []

    file.each do |record|
      bonus_params = {
        geom: record.geometry,
        created_at: Time.now.utc.iso8601,
        updated_at: Time.now.utc.iso8601
      }

      record_values = record.attributes.except('SHAPE_Leng', 'SHAPE_Area')
                            .transform_keys(&:downcase).merge!(bonus_params).transform_keys do |key|
        REZERVATAI_SHP_COLUMN_NAME_TO_FULL_NAME.keys.include?(key) ? REZERVATAI_SHP_COLUMN_NAME_TO_FULL_NAME[key] : key
      end

      values << record_values

      puts "collected #{record.index + 1}" if ((record.index + 1) % 100).zero?
    end

    slice_nr = 0
    values.each_slice(5000) do |slice|
      Rezervatas.insert_all(slice)
      slice_nr += 1
      puts "STK Rezervatai slice nr #{slice_nr} inserted"
    end

    puts 'Great Success!'
  end

end

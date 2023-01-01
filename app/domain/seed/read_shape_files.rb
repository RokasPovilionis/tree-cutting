# frozen_string_literal: true

# Class used to collect data from shp files and inserting them to the database
class Seed::ReadShapeFiles
  include Interactor::Initializer

  STK_SHP_COLUMN_NAME_TO_FULL_NAME = {
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
    'steig_ta_g' => 'steig_ta_galiojantis',
    'eng_draust' => 'eng_draustinio_pobudis',
    'eng_drau00' => 'eng_draustinio_rusis',
    'kult_pavel' => 'kult_paveld_kodas',
    'skelb_tiks' => 'skelb_tikslas',
    'adm_hier_k' => 'adm_hier_kodas',
    'adm_pavadi' => 'adm_pavadinimas',
    'adm_hier00' => 'adm_hier_kodas_sen',
    'adm_pava00' => 'adm_pavadinimas_sen',
    'gyv_rej_ko' => 'gyv_rej_kodas',
    'gyv_pavad_' => 'gyv_pavad_v',
    'ar_gamt_pa' => 'ar_gamt_paminkl',
    'gamt_pam_s' => 'gamt_pam_steig_ta',
    'gamt_pam00' => 'gamt_pam_steig_data',
    'eng_objekt' => 'eng_objektu_rusys',
    'eng_skelbe' => 'eng_skelbejas',
    'eng_skelb_' => 'eng_skelb_tikslas',
    'eng_ar_gam' => 'eng_ar_gamt_paminkl'
  }.freeze

  initialize_with :model_class, :file_location, :use_constant

  def run
    @extracted_values = []

    read_file_contents

    insert_to_database(@extracted_values)
  end

  private

  def read_file_contents
    RGeo::Shapefile::Reader.open(file_location) do |file|
      puts "File contains #{file.num_records} records."

      collect_file_values(file)
    end
  end

  def collect_file_values(file)
    file.each do |record|
      @extracted_values << serialized_record_attributes(record)

      puts "collected #{record.index + 1}" if ((record.index + 1) % 100).zero?
    end
  end

  def serialized_record_attributes(record)
    record
      .attributes.except('SHAPE_Leng', 'SHAPE_Area')
      .transform_keys(&:downcase)
      .merge!(record_bonus_params(record))
      .transform_keys do |key|
        STK_SHP_COLUMN_NAME_TO_FULL_NAME.keys.include?(key) && use_constant ? STK_SHP_COLUMN_NAME_TO_FULL_NAME[key] : key
      end
  end

  def record_bonus_params(record)
    {
      geom: record.geometry,
      created_at: Time.now.utc.iso8601,
      updated_at: Time.now.utc.iso8601
    }
  end

  def insert_to_database(values)
    slice_nr = 0

    values.each_slice(5000) do |slice|
      model_class.insert_all(slice)
      slice_nr += 1
      puts "slice nr #{slice_nr} inserted"
    end
  end
end

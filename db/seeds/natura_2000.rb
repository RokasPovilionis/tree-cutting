# frozen_string_literal: true

NATURA_SHP_COLUMN_NAME_TO_FULL_NAME = {
  'id' => 'id_kodas',
  'steig_tiks' => 'steig_tikslas',
  'eng_steig_' => 'eng_steig_tikslas',
  'id_registr' => 'id_registratorius_reg',
  'id_regis00' => 'id_registratorius_kor'
}.freeze

if Bast.all.count.zero?

  puts 'seeding buveinių apsaugai svarbias teritorijas'

  RGeo::Shapefile::Reader.open("#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BAST.shp") do |file|
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
        NATURA_SHP_COLUMN_NAME_TO_FULL_NAME.keys.include?(key) ? NATURA_SHP_COLUMN_NAME_TO_FULL_NAME[key] : key
      end

      values << record_values

      puts "collected #{record.index + 1}" if ((record.index + 1) % 100).zero?
    end

    slice_nr = 0
    values.each_slice(5000) do |slice|
      Bast.insert_all(slice)
      slice_nr += 1
      puts "Buveinių apsaugai svarbi teritorija slice nr #{slice_nr} inserted"
    end

    puts 'Great Success!'
  end

end

if Past.all.count.zero?

  puts 'seeding paukščių apsaugai svarbias teritorijas'

  RGeo::Shapefile::Reader.open("#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/PAST.shp") do |file|
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
        NATURA_SHP_COLUMN_NAME_TO_FULL_NAME.keys.include?(key) ? NATURA_SHP_COLUMN_NAME_TO_FULL_NAME[key] : key
      end

      values << record_values

      puts "collected #{record.index + 1}" if ((record.index + 1) % 100).zero?
    end

    slice_nr = 0
    values.each_slice(5000) do |slice|
      Past.insert_all(slice)
      slice_nr += 1
      puts "paukščių apsaugai svarbi teritorija slice nr #{slice_nr} inserted"
    end

    puts 'Great Success!'
  end
end

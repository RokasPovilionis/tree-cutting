# frozen_string_literal: true

# Class used to collect data from shp files and inserting them to the database
class Seed::ReadShapeFiles
  include Interactor::Initializer

  initialize_with :model_class, :file_location

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

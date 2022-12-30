# frozen_string_literal: true

# Adds STK Zoologinaii Gamtos paveldo objektai Plotiniai table
class AddZoologiniaiGpoTaskiniaiTable < ActiveRecord::Migration[6.1]
  def self.up
    table = DBF::Table.new("#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Zoologiniai_GPO_Plot.dbf")
    bonus_columns =
      "t.column \"geom\", :multi_polygon, srid: 4326, has_z: 1, has_m: 1\n   t.column \"created_at\", :date\n   t.column \"updated_at\", :date\n  end\nend"

    table_schema =
      table
      .schema.gsub("\"id\"", "\"id_kodas\"")
      .gsub("end\nend", bonus_columns)

    eval(table_schema)
  end

  def self.down
    drop_table :Zoologiniai_GPO_Plot
  end
end

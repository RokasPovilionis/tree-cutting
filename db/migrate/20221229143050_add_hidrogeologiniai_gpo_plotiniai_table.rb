# frozen_string_literal: true

# Adds STK Hidrogeologiniai Gamtos paveldo objektai Plotiniai table
class AddHidrogeologiniaiGpoPlotiniaiTable < ActiveRecord::Migration[6.1]
  def self.up
    table = DBF::Table.new(GetFileByEnv.for('valstybes_saugomu_teritoriju_kadastras/Hidrogeologiniai_GPO_Plot.dbf'))
    table.name ||= 'Hidrogeologiniai_GPO_Plot'
    bonus_columns =
      "t.column \"geom\", :multi_polygon, srid: 4326, has_z: 1, has_m: 1\n   t.column \"created_at\", :date\n   t.column \"updated_at\", :date\n"

    table_schema =
      table
      .schema.gsub("\"id\"", "\"id_kodas\"")
      .gsub("t.column \"shape_leng\", :float\n    ", '')
      .gsub("t.column \"shape_area\", :float\n", bonus_columns)

    eval(table_schema)
  end

  def self.down
    drop_table :Hidrogeologiniai_GPO_Plot
  end
end

# frozen_string_literal: true

# Adds STK Botaniniai Gamtos paveldo objektai Taskiniai table
class AddBotaniniaiGpoTaskiniaiTable < ActiveRecord::Migration[6.1]
  def self.up
    table = DBF::Table.new(GetFileByEnv.for('valstybes_saugomu_teritoriju_kadastras/Botaniniai_GPO_Task.dbf'))
    bonus_columns =
      "t.column \"geom\", :st_point, srid: 4326, has_z: 1, has_m: 1\n   t.column \"created_at\", :date\n   t.column \"updated_at\", :date\n  end\nend"

    table_schema =
      table
      .schema.gsub("\"id\"", "\"id_kodas\"")
      .gsub("end\nend", bonus_columns)

    eval(table_schema)
  end

  def self.down
    drop_table :Botaniniai_GPO_Task
  end
end

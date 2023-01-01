# frozen_string_literal: true

# Adds STK Geologiniai Gamtos paveldo objektai taskiniai table
class AddStkGeologiniaiGpoTaskiniaiTable < ActiveRecord::Migration[6.1]
  def self.up
    table = DBF::Table.new("#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geologiniai_GPO_Task.dbf")
    bonus_columns =
      "t.column \"geom\", :st_point, srid: 4326, has_z: 1, has_m: 1\n   t.column \"created_at\", :date\n   t.column \"updated_at\", :date\n  end\nend"

    table_schema =
      table
      .schema.gsub("\"id\"", "\"id_kodas\"")
      .gsub("end\nend", bonus_columns)

    eval(table_schema)
  end

  def self.down
    drop_table :Geologiniai_GPO_Task
  end
end

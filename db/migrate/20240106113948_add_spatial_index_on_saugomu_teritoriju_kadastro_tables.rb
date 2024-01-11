# frozen_string_literal: true

# Adds indexes for SaugomuTeritorijuKadastro tables
class AddSpatialIndexOnSaugomuTeritorijuKadastroTables < ActiveRecord::Migration[7.1]
  def change
    add_index :BAST, :geom, using: :gist
    add_index :PAST, :geom, using: :gist
    add_index :Rezervatai, :geom, using: :gist
    add_index :Draustiniai, :geom, using: :gist
    add_index :Geologiniai_GPO_Plot, :geom, using: :gist
    add_index :Geologiniai_GPO_Task, :geom, using: :gist
    add_index :Hidrografiniai_GPO_Plot, :geom, using: :gist
    add_index :Geomorfologiniai_GPO_Plot, :geom, using: :gist
    add_index :Hidrogeologiniai_GPO_Plot, :geom, using: :gist
    add_index :Botaniniai_GPO_Plot, :geom, using: :gist
    add_index :Botaniniai_GPO_Task, :geom, using: :gist
    add_index :Zoologiniai_GPO_Plot, :geom, using: :gist
    add_index :STK_Sklypai, :geom, using: :gist
    add_index :STK_Parkai, :geom, using: :gist
    add_index :BiosferosRezervatai, :geom, using: :gist
    add_index :BiosferosPoligonai, :geom, using: :gist
    add_index :FunkcinioPrioritetoZonos, :geom, using: :gist
    add_index :BuferinesApsaugosZonos, :geom, using: :gist
  end
end

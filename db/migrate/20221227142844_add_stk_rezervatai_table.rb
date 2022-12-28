# frozen_string_literal: true

# Adds Rezervatai STK table
class AddStkRezervataiTable < ActiveRecord::Migration[6.1]
  def change
    create_table :rezervatai do |t|
      t.string :id_kodas, null: false
      t.string :pavadinima, null: false
      t.string :gkodas, null: false
      t.integer :rezervat_p, null: false
      t.integer :reiksme, null: false
      t.integer :lat, null: false
      t.integer :lon, null: false
      t.integer :plotas
      t.string :steigejas
      t.date :steig_data
      t.string :steig_ta
      t.text :steig_tikslas, null: false
      t.text :vieta, null: false
      t.text :bendr_regl, null: false
      t.text :spec_regla
      t.date :reg_data
      t.date :isreg_data
      t.string :isreg_prie
      t.string :isreg_ta
      t.text :saltiniai
      t.integer :tarptautinis_svarbos_statusas
      t.text :tarptautinis_svarbos_aprasymas
      t.integer :gamtiniai_kompleksai
      t.string :duomen_mon
      t.string :buferines_zonos_aprasymas
      t.text :tvarkymo_zonos_aprasymas
      t.text :planavimo_dokumentu_aprasymas
      t.text :pastabos
      t.integer :id_vart
      t.date :kor_data
      t.string :id_registratorius_reg, null: false
      t.string :id_registratorius_kor, null: false
      t.string :eng_pavadi, null: false
      t.string :eng_rezervato_pobudis
      t.integer :eng_reiksm
      t.string :eng_steigejas
      t.text :eng_steig_tikslas, null: false
      t.text :eng_vieta
      t.text :eng_saltin
      t.integer :eng_tarptautines_svarbos_statusas
      t.text :eng_tarptautines_svarbos_aprasymas
      t.integer :eng_gamtiniai_kompleksai
      t.text :eng_pastabos
      t.string :steigejas_galiojantis
      t.date :steig_data_galiojantis
      t.text :steig_ta_galiojantis
      t.text :ta_nust_st
      t.string :st_id
      t.multi_polygon :geom, srid: 4326, has_z: true, has_m: true
      t.timestamps
    end

    add_index :rezervatai, :geom, using: :gist
  end
end

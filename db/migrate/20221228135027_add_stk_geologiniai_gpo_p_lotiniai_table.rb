class AddStkGeologiniaiGpoPLotiniaiTable < ActiveRecord::Migration[6.1]
  def change
    create_table :geologiniai_gpo_plotiniai do |t|
      t.string :id_kodas, null: false
      t.string :pavadinima, null: false
      t.string :gkodas, null: false
      t.integer :reiksme, null: false
      t.integer :objektu_ru, null: false
      t.integer :kult_paveld_kodas
      t.string :st_id
      t.integer :lat, null: false
      t.integer :lon, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.string :skelbejas
      t.date :skelb_data
      t.string :skelb_ta
      t.text :skelb_tikslas, null: false
      t.integer :aukstis, null: false
      t.integer :ilgis, null: false
      t.integer :plotis, null: false
      t.integer :plotas, null: false
      t.integer :perimet, null: false
      t.string :kiti
      t.integer :pav_id
      t.text :pastabos
      t.text :vieta, null: false
      t.integer :adm_hier_kodas
      t.string :adm_pavadinimas
      t.integer :adm_hier_kodas_sen
      t.string :adm_pavadinimas_sen
      t.integer :gyv_rej_kodas
      t.string :gyv_pavad_v
      t.integer :gat_kodas
      t.string :gat_pavadi
      t.integer :mu_kod
      t.string :mu_pavad
      t.integer :gir_kod
      t.string :gir_pavad
      t.integer :kv_nr
      t.integer :skl_nr
      t.string :skl_geo
      t.integer :ar_gamt_paminkl
      t.text :gamt_pam_steig_ta
      t.date :gamt_pam_steig_data
      t.integer :bendr_regl, null: false
      t.text :spec_regla
      t.date :reg_data
      t.date :isreg_data
      t.string :isreg_prie
      t.string :isreg_ta
      t.text :saltiniai
      t.string :buferines_zonos_aprasymas
      t.text :planavimo_dokumentu_aprasymas
      t.integer :id_vart
      t.date :kor_data
      t.string :id_registratorius_reg, null: false
      t.string :id_registratorius_kor, null: false
      t.string :eng_pavadi, null: false
      t.integer :eng_reiksm
      t.integer :eng_objektu_rusys
      t.string :eng_skelbejas
      t.text :eng_skelb_tikslas
      t.text :eng_vieta
      t.integer :eng_ar_gamt_paminkl
      t.text :eng_saltin
      t.text :eng_pastabos
      t.string :steigejas_galiojantis
      t.date :steig_data
      t.text :steig_ta_galiojantis
      t.integer :obj_status
      t.string :eng_kiti
      t.multi_polygon :geom, srid: 4326, has_z: true, has_m: true
      t.timestamps
    end

    add_index :geologiniai_gpo_plotiniai, :geom, using: :gist
  end
end

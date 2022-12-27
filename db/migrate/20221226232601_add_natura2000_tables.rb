# frozen_string_literal: true

# Adds tables needed for natura 2000
class AddNatura2000Tables < ActiveRecord::Migration[6.1]
  def change
    create_table :bast do |t|
      t.string :id_kodas, null: false
      t.string :sitecode, null: false
      t.string :gkodas, null: false
      t.string :pavadinima, null: false
      t.string :eng_pavadi, null: false
      t.text :vieta, null: false
      t.integer :lat, null: false
      t.integer :lon, null: false
      t.integer :plotas
      t.integer :ilgis
      t.integer :statusas_b, null: false
      t.date :steig_data
      t.string :statuso_ta
      t.text :steig_tikslas, null: false
      t.text :eng_steig_tikslas, null: false
      t.text :bendr_regl, null: false
      t.date :reg_data, null: false
      t.date :isreg_data
      t.string :isreg_prie
      t.string :isreg_ta
      t.date :kor_data
      t.string :id_registratorius_reg, null: false
      t.string :id_registratorius_kor, null: false
      t.integer :id_vart
      t.text :pastabos
      t.multi_polygon :geom, srid: 4326, has_z: true, has_m: true
      t.timestamps
    end

    create_table :past do |t|
      t.string :id_kodas, null: false
      t.string :sitecode, null: false
      t.string :gkodas, null: false
      t.string :pavadinima, null: false
      t.string :eng_pavadi, null: false
      t.text :vieta, null: false
      t.integer :lat, null: false
      t.integer :lon, null: false
      t.integer :plotas
      t.integer :ilgis
      t.date :steig_data
      t.string :steig_ta
      t.text :steig_tikslas, null: false
      t.text :eng_steig_tikslas, null: false
      t.text :bendr_regl, null: false
      t.date :reg_data, null: false
      t.date :isreg_data
      t.string :isreg_prie
      t.string :isreg_ta
      t.date :kor_data
      t.string :id_registratorius_reg, null: false
      t.string :id_registratorius_kor, null: false
      t.integer :id_vart
      t.text :pastabos
      t.multi_polygon :geom, srid: 4326, has_z: true, has_m: true
      t.timestamps
    end

    add_index :bast, :geom, using: :gist
    add_index :past, :geom, using: :gist
  end
end

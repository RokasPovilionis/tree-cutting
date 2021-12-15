# frozen_string_literal: true

# Changes naming to lowercase
class FixTableNaming < ActiveRecord::Migration[6.1]
  def change
    create_table :uredijos do |t|
      t.string :mu_kod, null: false
      t.string :pavadinimas, null: false
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end

    create_table :girininkijos do |t|
      t.string :mu_kod, null: false
      t.string :gir_kod, null: false
      t.string :pavadinimas, null: false
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end

    create_table :kvartalai do |t|
      t.string :mu_kod, null: false
      t.string :gir_kod, null: false
      t.string :kv_nr, null: false
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end

    create_table :sklypai do |t|
      t.string :mu_kod, null: false
      t.string :gir_kod, null: false
      t.string :kv_nr, null: false
      t.string :skl_nr, null: false
      t.string :skl_geo, null: false
      t.integer :zkg, null: false
      t.string :vmr
      t.integer :amz
      t.integer :h
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end

    create_table :valst_r_miskai do |t|
      t.integer :mu
      t.integer :gir
      t.integer :kv
      t.integer :geo_kv
      t.integer :saviv
      t.float :kv_saviv
      t.float :pl
      t.date :lrv_data
      t.integer :lrv_nr
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end

    create_table :misku_pogrupiai do |t|
      t.integer :mu
      t.integer :saviv, null: false
      t.date :lrv_data, null: false
      t.integer :lrv_nr, null: false
      t.integer :grupe, null: false
      t.integer :pogrupis, null: false
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end

    create_table :kmb_geoobjektas do |t|
      t.float :kmb_kod, null: false
      t.integer :ur
      t.integer :gir
      t.string :kmb_tip_kod
      t.string :pot_kmb_tip_kod
      t.string :pastabos
      t.multi_polygon :geom, srid: 4326
      t.timestamps
    end
  end
end

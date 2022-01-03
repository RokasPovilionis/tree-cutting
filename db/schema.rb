# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_03_051743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "girininkijos", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "gir_kod", null: false
    t.string "pavadinimas", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_girininkijos_on_geom", using: :gist
    t.index ["mu_kod", "gir_kod"], name: "index_girininkijos_on_mu_kod_and_gir_kod", unique: true
    t.index ["pavadinimas"], name: "index_girininkijos_on_pavadinimas"
  end

  create_table "kirtimu_leidimai", force: :cascade do |t|
    t.string "serija_ir_nr", null: false
    t.string "regionas", null: false
    t.string "rajonas", null: false
    t.string "nuosavybes_forma", null: false
    t.string "uredija", null: false
    t.string "girininkija", null: false
    t.integer "kvartalas", null: false
    t.string "sklypai", null: false
    t.integer "plotas", null: false
    t.integer "kad_vietove", null: false
    t.integer "kad_blokas", null: false
    t.integer "kad_nr", null: false
    t.string "kirtimo_rusis", null: false
    t.date "galiojimo_pradzia", null: false
    t.date "galiojimo_pabaiga", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kmb_geoobjektas", force: :cascade do |t|
    t.float "kmb_kod", null: false
    t.integer "ur"
    t.integer "gir"
    t.string "kmb_tip_kod"
    t.string "pot_kmb_tip_kod"
    t.string "pastabos"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_kmb_geoobjektas_on_geom", using: :gist
  end

  create_table "kvartalai", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "gir_kod", null: false
    t.string "kv_nr", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_kvartalai_on_geom", using: :gist
    t.index ["mu_kod", "gir_kod", "kv_nr"], name: "index_kvartalai_on_mu_kod_and_gir_kod_and_kv_nr", unique: true
  end

  create_table "misku_pogrupiai", force: :cascade do |t|
    t.integer "mu"
    t.integer "saviv", null: false
    t.string "lrv_data", null: false
    t.integer "lrv_nr", null: false
    t.integer "grupe", null: false
    t.integer "pogrupis", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_misku_pogrupiai_on_geom", using: :gist
  end

  create_table "sklypai", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "gir_kod", null: false
    t.string "kv_nr", null: false
    t.string "skl_nr", null: false
    t.string "skl_geo", null: false
    t.integer "zkg", null: false
    t.string "vmr"
    t.integer "amz"
    t.integer "h"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_sklypai_on_geom", using: :gist
    t.index ["mu_kod", "gir_kod", "kv_nr", "skl_nr"], name: "index_sklypai_on_mu_kod_and_gir_kod_and_kv_nr_and_skl_nr", unique: true
  end

  create_table "uredijos", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "pavadinimas", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_uredijos_on_geom", using: :gist
    t.index ["mu_kod"], name: "index_uredijos_on_mu_kod", unique: true
    t.index ["pavadinimas"], name: "index_uredijos_on_pavadinimas"
  end

  create_table "valst_r_miskai", force: :cascade do |t|
    t.integer "mu"
    t.integer "gir"
    t.integer "kv"
    t.integer "geo_kv"
    t.integer "saviv"
    t.float "kv_saviv"
    t.float "pl"
    t.string "lrv_data"
    t.integer "lrv_nr"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_valst_r_miskai_on_geom", using: :gist
  end

end

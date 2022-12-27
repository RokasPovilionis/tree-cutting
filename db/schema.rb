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

ActiveRecord::Schema.define(version: 2022_12_26_232601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "bast", force: :cascade do |t|
    t.string "id_kodas", null: false
    t.string "sitecode", null: false
    t.string "gkodas", null: false
    t.string "pavadinima", null: false
    t.string "eng_pavadi", null: false
    t.text "vieta", null: false
    t.integer "lat", null: false
    t.integer "lon", null: false
    t.integer "plotas"
    t.integer "ilgis"
    t.integer "statusas_b", null: false
    t.date "steig_data"
    t.string "statuso_ta"
    t.text "steig_tikslas", null: false
    t.text "eng_steig_tikslas", null: false
    t.text "bendr_regl", null: false
    t.date "reg_data", null: false
    t.date "isreg_data"
    t.string "isreg_prie"
    t.string "isreg_ta"
    t.date "kor_data"
    t.string "id_registratorius_reg", null: false
    t.string "id_registratorius_kor", null: false
    t.integer "id_vart"
    t.text "pastabos"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_bast_on_geom", using: :gist
  end

  create_table "bast_ref", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.string "id", limit: 13
    t.string "sitecode", limit: 9
    t.string "gkodas", limit: 6
    t.string "vieta", limit: 254
    t.decimal "lat"
    t.decimal "lon"
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 200
    t.string "id_regis00", limit: 200
    t.float "id_vart"
    t.string "pastabos", limit: 254
    t.string "pavadinima", limit: 254
    t.string "eng_pavadi", limit: 254
    t.decimal "plotas"
    t.decimal "ilgis"
    t.float "statusas_b"
    t.string "statuso_ta", limit: 254
    t.string "bendr_regl", limit: 254
    t.string "isreg_ta", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_tiks", limit: 254
    t.string "eng_steig_", limit: 254
    t.decimal "shape_leng"
    t.decimal "shape_area"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
  end

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
    t.index ["created_at"], name: "index_kirtimu_leidimai_on_created_at"
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

  create_table "past", force: :cascade do |t|
    t.string "id_kodas", null: false
    t.string "sitecode", null: false
    t.string "gkodas", null: false
    t.string "pavadinima", null: false
    t.string "eng_pavadi", null: false
    t.text "vieta", null: false
    t.integer "lat", null: false
    t.integer "lon", null: false
    t.integer "plotas"
    t.integer "ilgis"
    t.date "steig_data"
    t.string "steig_ta"
    t.text "steig_tikslas", null: false
    t.text "eng_steig_tikslas", null: false
    t.text "bendr_regl", null: false
    t.date "reg_data", null: false
    t.date "isreg_data"
    t.string "isreg_prie"
    t.string "isreg_ta"
    t.date "kor_data"
    t.string "id_registratorius_reg", null: false
    t.string "id_registratorius_kor", null: false
    t.integer "id_vart"
    t.text "pastabos"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_past_on_geom", using: :gist
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "roles", default: "user", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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

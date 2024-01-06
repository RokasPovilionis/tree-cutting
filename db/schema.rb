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

ActiveRecord::Schema[7.1].define(version: 2024_01_06_113948) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "BAST", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "sitecode", limit: 9
    t.string "gkodas", limit: 6
    t.string "vieta", limit: 254
    t.float "lat"
    t.float "lon"
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 200
    t.string "id_regis00", limit: 200
    t.integer "id_vart"
    t.string "pastabos", limit: 254
    t.string "pavadinima", limit: 254
    t.string "eng_pavadi", limit: 254
    t.float "plotas"
    t.float "ilgis"
    t.integer "statusas_b"
    t.string "statuso_ta", limit: 254
    t.string "bendr_regl", limit: 254
    t.string "isreg_ta", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_tiks", limit: 254
    t.string "eng_steig_", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_BAST_on_geom", using: :gist
  end

  create_table "BiosferosPoligonai", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.float "lat"
    t.float "lon"
    t.float "plotas"
    t.string "steigejas", limit: 200
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 200
    t.string "steig_tiks", limit: 254
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.integer "tarpt_svar"
    t.string "tarpt_sv00", limit: 254
    t.string "duomen_mon", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.string "eng_steige", limit: 200
    t.string "eng_steig_", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "eng_saltin", limit: 254
    t.integer "eng_tarpt_"
    t.string "eng_tarp00", limit: 254
    t.string "eng_pastab", limit: 254
    t.integer "reiksme"
    t.integer "eng_reiksm"
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "tvarkymo_z", limit: 254
    t.string "funkc_prio", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_BiosferosPoligonai_on_geom", using: :gist
  end

  create_table "BiosferosRezervatai", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.float "lat"
    t.float "lon"
    t.float "plotas"
    t.string "steigejas", limit: 200
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 200
    t.string "steig_tiks", limit: 254
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.integer "tarpt_svar"
    t.string "tarpt_sv00", limit: 254
    t.string "duomen_mon", limit: 250
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.string "eng_steige", limit: 200
    t.string "eng_steig_", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "eng_saltin", limit: 254
    t.integer "eng_tarpt_"
    t.string "eng_tarp00", limit: 254
    t.string "eng_pastab", limit: 254
    t.integer "reiksme"
    t.integer "eng_reiksm"
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "tvarkymo_z", limit: 254
    t.string "funkc_prio", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_BiosferosRezervatai_on_geom", using: :gist
  end

  create_table "Botaniniai_GPO_Plot", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "porus"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.string "rusis", limit: 100
    t.string "rus_sudeti", limit: 100
    t.float "apimtis"
    t.float "aukstis"
    t.float "proj_plota"
    t.float "plotas"
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.string "eng_porus", limit: 50
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "eng_kiti", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Botaniniai_GPO_Plot_on_geom", using: :gist
  end

  create_table "Botaniniai_GPO_Task", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "porus"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.string "rusis", limit: 100
    t.string "rus_sudeti", limit: 100
    t.float "apimtis"
    t.float "aukstis"
    t.float "proj_plota"
    t.float "plotas"
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.string "eng_porus", limit: 50
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "eng_kiti", limit: 254
    t.string "eng_rusis", limit: 100
    t.geometry "geom", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Botaniniai_GPO_Task_on_geom", using: :gist
  end

  create_table "BuferinesApsaugosZonos", force: :cascade do |t|
    t.string "gkodas", limit: 6
    t.string "st_gkodas", limit: 6
    t.string "st_id", limit: 13
    t.float "plotas"
    t.string "teisinis_p", limit: 100
    t.string "data", limit: 20
    t.integer "pozymis"
    t.string "pastabos", limit: 254
    t.string "reg_data", limit: 20
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_st_gko", limit: 6
    t.integer "eng_pozymi"
    t.string "eng_pastab", limit: 254
    t.float "lat"
    t.float "lon"
    t.string "steigejas", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 254
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 254
    t.string "isreg_ta", limit: 254
    t.string "eng_steige", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "id_kodas", limit: 52
    t.string "steig_tiks", limit: 254
    t.string "eng_steig_", limit: 254
    t.string "vieta", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_BuferinesApsaugosZonos_on_geom", using: :gist
  end

  create_table "Draustiniai", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "draust_pob"
    t.integer "draust_rus"
    t.integer "draust_por"
    t.float "lat"
    t.float "lon"
    t.float "plotas"
    t.string "steigejas", limit: 200
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 200
    t.string "steig_tiks", limit: 254
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.integer "tarpt_svar"
    t.string "tarpt_sv00", limit: 254
    t.integer "gamtiniai_"
    t.string "duomen_mon", limit: 250
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.string "eng_draust", limit: 50
    t.integer "eng_drau00"
    t.integer "eng_reiksm"
    t.string "eng_steige", limit: 200
    t.string "eng_steig_", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "eng_saltin", limit: 254
    t.integer "eng_tarpt_"
    t.string "eng_tarp00", limit: 254
    t.integer "eng_gamtin"
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "st_id", limit: 52
    t.string "tvarkymo_z", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.string "ta_nust_st", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Draustiniai_on_geom", using: :gist
  end

  create_table "FunkcinioPrioritetoZonos", force: :cascade do |t|
    t.string "gkodas", limit: 6
    t.string "pavadinima", limit: 100
    t.string "st_id", limit: 13
    t.string "st_gkodas", limit: 6
    t.float "plotas"
    t.string "teisinis_p", limit: 100
    t.string "schemos_re", limit: 100
    t.string "plano_data", limit: 20
    t.string "schem_apra", limit: 250
    t.string "pastabos", limit: 254
    t.string "reg_data", limit: 20
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 100
    t.string "eng_gkodas", limit: 6
    t.string "eng_st_gko", limit: 6
    t.string "eng_schemo", limit: 100
    t.string "eng_schem_", limit: 250
    t.string "eng_pastab", limit: 254
    t.integer "st_tipas"
    t.integer "pobudis"
    t.float "lat"
    t.float "lon"
    t.string "steigejas", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 254
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 254
    t.string "isreg_ta", limit: 254
    t.string "eng_steige", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "id_kodas", limit: 52
    t.string "steig_tiks", limit: 254
    t.string "eng_steig_", limit: 254
    t.string "vieta", limit: 254
    t.integer "reiksme"
    t.integer "eng_reiksm"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_FunkcinioPrioritetoZonos_on_geom", using: :gist
  end

  create_table "Geologiniai_GPO_Plot", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.float "aukstis"
    t.float "ilgis"
    t.float "plotis"
    t.float "plotas"
    t.float "perimet"
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "eng_kiti", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Geologiniai_GPO_Plot_on_geom", using: :gist
  end

  create_table "Geologiniai_GPO_Task", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.float "aukstis"
    t.float "ilgis"
    t.float "plotis"
    t.float "plotas"
    t.float "perimet"
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.integer "id_vart"
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "eng_kiti", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Geologiniai_GPO_Task_on_geom", using: :gist
  end

  create_table "Geomorfologiniai_GPO_Plot", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.float "aukstis"
    t.float "ilgis"
    t.float "plotis"
    t.float "plotas"
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.integer "id_vart"
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "eng_kiti", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Geomorfologiniai_GPO_Plot_on_geom", using: :gist
  end

  create_table "Hidrogeologiniai_GPO_Plot", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.float "plotas"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.string "orograf_pa", limit: 250
    t.string "uolienos", limit: 254
    t.string "fiz_savyb", limit: 254
    t.string "chem_savyb", limit: 254
    t.float "debitas"
    t.string "dujos", limit: 100
    t.string "rezimas", limit: 250
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.float "mineraliza"
    t.float "vandenskie"
    t.integer "obj_status"
    t.string "vandens_ti", limit: 100
    t.string "eng_vanden", limit: 100
    t.string "eng_kiti", limit: 100
    t.string "aprasymas", limit: 254
    t.string "eng_aprasy", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Hidrogeologiniai_GPO_Plot_on_geom", using: :gist
  end

  create_table "Hidrografiniai_GPO_Plot", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "objektu_ru"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.float "plotas"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.string "formos", limit: 250
    t.string "israiska", limit: 250
    t.string "kiti", limit: 254
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.integer "eng_objekt"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "eng_kiti", limit: 254
    t.string "aprasymas", limit: 254
    t.string "eng_aprasy", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Hidrografiniai_GPO_Plot_on_geom", using: :gist
  end

  create_table "PAST", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "sitecode", limit: 9
    t.string "gkodas", limit: 6
    t.string "vieta", limit: 254
    t.float "lat"
    t.float "lon"
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 200
    t.string "id_regis00", limit: 200
    t.integer "id_vart"
    t.string "pastabos", limit: 254
    t.string "pavadinima", limit: 254
    t.string "eng_pavadi", limit: 254
    t.float "plotas"
    t.float "ilgis"
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 254
    t.string "bendr_regl", limit: 254
    t.string "isreg_ta", limit: 254
    t.string "steig_tiks", limit: 254
    t.string "eng_steig_", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_PAST_on_geom", using: :gist
  end

  create_table "Rezervatai", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "rezervat_p"
    t.integer "reiksme"
    t.float "lat"
    t.float "lon"
    t.float "plotas"
    t.string "steigejas", limit: 200
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 200
    t.string "steig_tiks", limit: 254
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.integer "tarpt_svar"
    t.string "tarpt_sv00", limit: 254
    t.integer "gamtiniai_"
    t.string "duomen_mon", limit: 250
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.string "eng_rezerv", limit: 50
    t.integer "eng_reiksm"
    t.string "eng_steige", limit: 200
    t.string "eng_steig_", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "eng_saltin", limit: 254
    t.integer "eng_tarpt_"
    t.string "eng_tarp00", limit: 254
    t.integer "eng_gamtin"
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "st_id", limit: 52
    t.string "tvarkymo_z", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.string "ta_nust_st", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Rezervatai_on_geom", using: :gist
  end

  create_table "STK_Parkai", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "tipas"
    t.integer "parko_pobu"
    t.float "lat"
    t.float "lon"
    t.float "plotas"
    t.string "steigejas", limit: 200
    t.string "steig_data", limit: 20
    t.string "steig_ta", limit: 200
    t.string "steig_tiks", limit: 254
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.integer "tarpt_svar"
    t.string "tarpt_sv00", limit: 254
    t.integer "gamtiniai_"
    t.string "kult_pavel", limit: 250
    t.string "duomen_mon", limit: 250
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.string "eng_tipas", limit: 50
    t.integer "eng_parko_"
    t.string "eng_steige", limit: 200
    t.string "eng_steig_", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "eng_saltin", limit: 254
    t.integer "eng_tarpt_"
    t.string "eng_tarp00", limit: 254
    t.integer "eng_gamtin"
    t.string "eng_pastab", limit: 254
    t.integer "reiksme"
    t.integer "eng_reiksm"
    t.string "steigejas_", limit: 254
    t.string "steig_da00", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "tvarkymo_z", limit: 254
    t.string "funkc_prio", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_STK_Parkai_on_geom", using: :gist
  end

  create_table "STK_Sklypai", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "tipas"
    t.integer "skl_rus"
    t.float "lat"
    t.float "lon"
    t.float "plotas"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.integer "tarpt_svar"
    t.string "tarpt_sv00", limit: 254
    t.string "istekl_buk", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.string "eng_tipas", limit: 50
    t.integer "eng_skl_ru"
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.string "eng_saltin", limit: 254
    t.integer "eng_tarpt_"
    t.string "eng_tarp00", limit: 254
    t.string "eng_pastab", limit: 254
    t.integer "reiksme"
    t.integer "eng_reiksm"
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_STK_Sklypai_on_geom", using: :gist
  end

  create_table "Zoologiniai_GPO_Plot", force: :cascade do |t|
    t.string "id_kodas", limit: 13
    t.string "pavadinima", limit: 200
    t.string "gkodas", limit: 6
    t.integer "reiksme"
    t.integer "porus"
    t.integer "kult_pavel"
    t.string "st_id", limit: 13
    t.float "lat"
    t.float "lon"
    t.integer "x"
    t.integer "y"
    t.float "plotas"
    t.string "skelbejas", limit: 200
    t.string "skelb_data", limit: 20
    t.string "skelb_ta", limit: 200
    t.string "skelb_tiks", limit: 254
    t.string "rusis", limit: 100
    t.string "radaviete", limit: 254
    t.string "kiti", limit: 100
    t.integer "pav_id"
    t.integer "adm_hier_k"
    t.string "adm_pavadi", limit: 50
    t.integer "adm_hier00"
    t.string "adm_pava00", limit: 50
    t.integer "gyv_rej_ko"
    t.string "gyv_pavad_", limit: 50
    t.integer "gat_kodas"
    t.string "gat_pavadi", limit: 50
    t.integer "mu_kod"
    t.string "mu_pavad", limit: 100
    t.integer "gir_kod"
    t.string "gir_pavad", limit: 100
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo", limit: 12
    t.integer "ar_gamt_pa"
    t.string "gamt_pam_s", limit: 254
    t.string "gamt_pam00", limit: 20
    t.integer "bendr_regl"
    t.string "spec_regla", limit: 254
    t.string "reg_data", limit: 20
    t.string "isreg_data", limit: 20
    t.string "isreg_prie", limit: 200
    t.string "isreg_ta", limit: 200
    t.string "saltiniai", limit: 254
    t.string "buf_zona_a", limit: 250
    t.string "pastabos", limit: 254
    t.string "kor_data", limit: 20
    t.string "id_registr", limit: 50
    t.string "id_regis00", limit: 50
    t.integer "id_vart"
    t.string "eng_pavadi", limit: 200
    t.integer "eng_reiksm"
    t.string "eng_porus", limit: 50
    t.string "eng_skelbe", limit: 200
    t.string "eng_skelb_", limit: 254
    t.string "eng_vieta", limit: 254
    t.integer "eng_ar_gam"
    t.string "eng_saltin", limit: 254
    t.string "eng_pastab", limit: 254
    t.string "steigejas_", limit: 254
    t.string "steig_data", limit: 20
    t.string "steig_ta_g", limit: 254
    t.string "planavimo_", limit: 254
    t.string "vieta", limit: 254
    t.integer "obj_status"
    t.string "aprasymas", limit: 254
    t.string "eng_aprasy", limit: 254
    t.string "eng_rusis", limit: 100
    t.float "shape_leng"
    t.float "shape_area"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.date "created_at"
    t.date "updated_at"
    t.index ["geom"], name: "index_Zoologiniai_GPO_Plot_on_geom", using: :gist
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cutting_permits", force: :cascade do |t|
    t.string "_type"
    t.string "_id"
    t.string "_revision"
    t.float "numeris"
    t.string "serija"
    t.string "tipas"
    t.float "kad_sklypo_nr"
    t.string "mu_id"
    t.string "ur_gir_id"
    t.string "strukp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cutting_violation_reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leidimas_id", null: false
    t.text "description", null: false
  end

  create_table "girininkijos", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "gir_kod", null: false
    t.string "pavadinimas", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geom"], name: "index_girininkijos_on_geom", using: :gist
    t.index ["mu_kod", "gir_kod"], name: "index_girininkijos_on_mu_kod_and_gir_kod", unique: true
    t.index ["pavadinimas"], name: "index_girininkijos_on_pavadinimas"
  end

  create_table "kirtimu_leidimai", force: :cascade do |t|
    t.string "serija_ir_nr", null: false
    t.string "regionas"
    t.string "rajonas"
    t.string "nuosavybes_forma", null: false
    t.string "uredija"
    t.string "girininkija", null: false
    t.integer "kvartalas", null: false
    t.string "sklypai", null: false
    t.integer "plotas", null: false
    t.integer "kad_vietove"
    t.integer "kad_blokas", null: false
    t.integer "kad_nr", null: false
    t.string "kirtimo_rusis", null: false
    t.date "galiojimo_pradzia", null: false
    t.date "galiojimo_pabaiga", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vmu_padalinys"
    t.string "kadastrinis_sklypas"
    t.string "galiojimas"
    t.boolean "is_notification_sent", default: false, null: false
    t.index ["created_at"], name: "index_kirtimu_leidimai_on_created_at"
    t.index ["is_notification_sent"], name: "index_kirtimu_leidimai_on_is_notification_sent"
  end

  create_table "kmb_geoobjektas", force: :cascade do |t|
    t.float "kmb_kod", null: false
    t.integer "ur"
    t.integer "gir"
    t.string "kmb_tip_kod"
    t.string "pot_kmb_tip_kod"
    t.string "pastabos"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geom"], name: "index_kmb_geoobjektas_on_geom", using: :gist
  end

  create_table "kvartalai", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "gir_kod", null: false
    t.string "kv_nr", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geom"], name: "index_misku_pogrupiai_on_geom", using: :gist
  end

  create_table "permit_location_subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "girininkija", null: false
    t.integer "kvartalas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["girininkija", "kvartalas"], name: "idx_on_girininkija_kvartalas_0c554ee4df"
    t.index ["user_id"], name: "index_permit_location_subscriptions_on_user_id"
  end

  create_table "permit_plot", force: :cascade do |t|
    t.bigint "permit_id", null: false
    t.bigint "plot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permit_id"], name: "index_permit_plot_on_permit_id"
    t.index ["plot_id"], name: "index_permit_plot_on_plot_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geom"], name: "index_sklypai_on_geom", using: :gist
    t.index ["mu_kod", "gir_kod", "kv_nr", "skl_nr"], name: "index_sklypai_on_mu_kod_and_gir_kod_and_kv_nr_and_skl_nr", unique: true
  end

  create_table "uredijos", force: :cascade do |t|
    t.string "mu_kod", null: false
    t.string "pavadinimas", null: false
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geom"], name: "index_valst_r_miskai_on_geom", using: :gist
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end

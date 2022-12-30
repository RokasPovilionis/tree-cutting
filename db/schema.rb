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

ActiveRecord::Schema.define(version: 2022_12_30_181742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

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
  end

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

  create_table "draustiniai", force: :cascade do |t|
    t.string "id_kodas", null: false
    t.string "pavadinima", null: false
    t.string "gkodas", null: false
    t.integer "reiksme", null: false
    t.integer "draust_pob", null: false
    t.integer "draust_rus", null: false
    t.integer "draust_por", null: false
    t.integer "lat", null: false
    t.integer "lon", null: false
    t.integer "plotas"
    t.string "steigejas"
    t.date "steig_data"
    t.string "steig_ta"
    t.text "steig_tikslas", null: false
    t.text "vieta", null: false
    t.text "bendr_regl", null: false
    t.text "spec_regla"
    t.date "reg_data"
    t.date "isreg_data"
    t.string "isreg_prie"
    t.string "isreg_ta"
    t.text "saltiniai"
    t.integer "tarptautinis_svarbos_statusas"
    t.text "tarptautinis_svarbos_aprasymas"
    t.integer "gamtiniai_kompleksai"
    t.string "duomen_mon"
    t.string "buferines_zonos_aprasymas"
    t.text "tvarkymo_zonos_aprasymas"
    t.text "planavimo_dokumentu_aprasymas"
    t.text "pastabos"
    t.integer "id_vart"
    t.date "kor_data"
    t.string "id_registratorius_reg", null: false
    t.string "id_registratorius_kor", null: false
    t.string "eng_pavadi", null: false
    t.string "eng_draustinio_pobudis"
    t.string "eng_draustinio_rusis"
    t.integer "eng_reiksm"
    t.string "eng_steigejas"
    t.text "eng_steig_tikslas", null: false
    t.text "eng_vieta"
    t.text "eng_saltin"
    t.integer "eng_tarptautines_svarbos_statusas"
    t.text "eng_tarptautines_svarbos_aprasymas"
    t.integer "eng_gamtiniai_kompleksai"
    t.text "eng_pastabos"
    t.string "steigejas_galiojantis"
    t.date "steig_data_galiojantis"
    t.text "steig_ta_galiojantis"
    t.text "ta_nust_st"
    t.string "st_id"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_draustiniai_on_geom", using: :gist
  end

  create_table "geologiniai_gpo_plotiniai", force: :cascade do |t|
    t.string "id_kodas", null: false
    t.string "pavadinima", null: false
    t.string "gkodas", null: false
    t.integer "reiksme", null: false
    t.integer "objektu_ru", null: false
    t.integer "kult_paveld_kodas"
    t.string "st_id"
    t.integer "lat", null: false
    t.integer "lon", null: false
    t.integer "x", null: false
    t.integer "y", null: false
    t.string "skelbejas"
    t.date "skelb_data"
    t.string "skelb_ta"
    t.text "skelb_tikslas", null: false
    t.integer "aukstis", null: false
    t.integer "ilgis", null: false
    t.integer "plotis", null: false
    t.integer "plotas", null: false
    t.integer "perimet", null: false
    t.string "kiti"
    t.integer "pav_id"
    t.text "pastabos"
    t.text "vieta", null: false
    t.integer "adm_hier_kodas"
    t.string "adm_pavadinimas"
    t.integer "adm_hier_kodas_sen"
    t.string "adm_pavadinimas_sen"
    t.integer "gyv_rej_kodas"
    t.string "gyv_pavad_v"
    t.integer "gat_kodas"
    t.string "gat_pavadi"
    t.integer "mu_kod"
    t.string "mu_pavad"
    t.integer "gir_kod"
    t.string "gir_pavad"
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo"
    t.integer "ar_gamt_paminkl"
    t.text "gamt_pam_steig_ta"
    t.date "gamt_pam_steig_data"
    t.integer "bendr_regl", null: false
    t.text "spec_regla"
    t.date "reg_data"
    t.date "isreg_data"
    t.string "isreg_prie"
    t.string "isreg_ta"
    t.text "saltiniai"
    t.string "buferines_zonos_aprasymas"
    t.text "planavimo_dokumentu_aprasymas"
    t.integer "id_vart"
    t.date "kor_data"
    t.string "id_registratorius_reg", null: false
    t.string "id_registratorius_kor", null: false
    t.string "eng_pavadi", null: false
    t.integer "eng_reiksm"
    t.integer "eng_objektu_rusys"
    t.string "eng_skelbejas"
    t.text "eng_skelb_tikslas"
    t.text "eng_vieta"
    t.integer "eng_ar_gamt_paminkl"
    t.text "eng_saltin"
    t.text "eng_pastabos"
    t.string "steigejas_galiojantis"
    t.date "steig_data"
    t.text "steig_ta_galiojantis"
    t.integer "obj_status"
    t.string "eng_kiti"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_geologiniai_gpo_plotiniai_on_geom", using: :gist
  end

  create_table "geologiniai_gpo_taskiniai", force: :cascade do |t|
    t.string "id_kodas", null: false
    t.string "pavadinima", null: false
    t.string "gkodas", null: false
    t.integer "reiksme", null: false
    t.integer "objektu_ru", null: false
    t.integer "kult_paveld_kodas"
    t.string "st_id"
    t.integer "lat", null: false
    t.integer "lon", null: false
    t.integer "x", null: false
    t.integer "y", null: false
    t.string "skelbejas"
    t.date "skelb_data"
    t.string "skelb_ta"
    t.text "skelb_tikslas", null: false
    t.integer "aukstis", null: false
    t.integer "ilgis", null: false
    t.integer "plotis", null: false
    t.integer "plotas", null: false
    t.integer "perimet", null: false
    t.string "kiti"
    t.integer "pav_id"
    t.text "pastabos"
    t.text "vieta", null: false
    t.integer "adm_hier_kodas"
    t.string "adm_pavadinimas"
    t.integer "adm_hier_kodas_sen"
    t.string "adm_pavadinimas_sen"
    t.integer "gyv_rej_kodas"
    t.string "gyv_pavad_v"
    t.integer "gat_kodas"
    t.string "gat_pavadi"
    t.integer "mu_kod"
    t.string "mu_pavad"
    t.integer "gir_kod"
    t.string "gir_pavad"
    t.integer "kv_nr"
    t.integer "skl_nr"
    t.string "skl_geo"
    t.integer "ar_gamt_paminkl"
    t.text "gamt_pam_steig_ta"
    t.date "gamt_pam_steig_data"
    t.integer "bendr_regl", null: false
    t.text "spec_regla"
    t.date "reg_data"
    t.date "isreg_data"
    t.string "isreg_prie"
    t.string "isreg_ta"
    t.text "saltiniai"
    t.string "buferines_zonos_aprasymas"
    t.text "planavimo_dokumentu_aprasymas"
    t.integer "id_vart"
    t.date "kor_data"
    t.string "id_registratorius_reg", null: false
    t.string "id_registratorius_kor", null: false
    t.string "eng_pavadi", null: false
    t.integer "eng_reiksm"
    t.integer "eng_objektu_rusys"
    t.string "eng_skelbejas"
    t.text "eng_skelb_tikslas"
    t.text "eng_vieta"
    t.integer "eng_ar_gamt_paminkl"
    t.text "eng_saltin"
    t.text "eng_pastabos"
    t.string "steigejas_galiojantis"
    t.date "steig_data"
    t.text "steig_ta_galiojantis"
    t.integer "obj_status"
    t.string "eng_kiti"
    t.geometry "geom", limit: {:srid=>4326, :type=>"st_point", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_geologiniai_gpo_taskiniai_on_geom", using: :gist
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

  create_table "rezervatai", force: :cascade do |t|
    t.string "id_kodas", null: false
    t.string "pavadinima", null: false
    t.string "gkodas", null: false
    t.integer "rezervat_p", null: false
    t.integer "reiksme", null: false
    t.integer "lat", null: false
    t.integer "lon", null: false
    t.integer "plotas"
    t.string "steigejas"
    t.date "steig_data"
    t.string "steig_ta"
    t.text "steig_tikslas", null: false
    t.text "vieta", null: false
    t.text "bendr_regl", null: false
    t.text "spec_regla"
    t.date "reg_data"
    t.date "isreg_data"
    t.string "isreg_prie"
    t.string "isreg_ta"
    t.text "saltiniai"
    t.integer "tarptautinis_svarbos_statusas"
    t.text "tarptautinis_svarbos_aprasymas"
    t.integer "gamtiniai_kompleksai"
    t.string "duomen_mon"
    t.string "buferines_zonos_aprasymas"
    t.text "tvarkymo_zonos_aprasymas"
    t.text "planavimo_dokumentu_aprasymas"
    t.text "pastabos"
    t.integer "id_vart"
    t.date "kor_data"
    t.string "id_registratorius_reg", null: false
    t.string "id_registratorius_kor", null: false
    t.string "eng_pavadi", null: false
    t.string "eng_rezervato_pobudis"
    t.integer "eng_reiksm"
    t.string "eng_steigejas"
    t.text "eng_steig_tikslas", null: false
    t.text "eng_vieta"
    t.text "eng_saltin"
    t.integer "eng_tarptautines_svarbos_statusas"
    t.text "eng_tarptautines_svarbos_aprasymas"
    t.integer "eng_gamtiniai_kompleksai"
    t.text "eng_pastabos"
    t.string "steigejas_galiojantis"
    t.date "steig_data_galiojantis"
    t.text "steig_ta_galiojantis"
    t.text "ta_nust_st"
    t.string "st_id"
    t.geometry "geom", limit: {:srid=>4326, :type=>"multi_polygon", :has_z=>true, :has_m=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["geom"], name: "index_rezervatai_on_geom", using: :gist
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

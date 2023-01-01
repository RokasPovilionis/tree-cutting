# frozen_string_literal: true

MANUALLY_INSERTED_STK_TABLES = [
  { class: Rezervatas,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Rezervatai.shp" },
  { class: Draustinis,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Draustiniai.shp" },
  { class: GeologiniaiGpoPlotiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geologiniai_GPO_Plot.shp" },
  { class: GeologiniaiGpoTaskiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geologiniai_GPO_Task.shp" }
].freeze

DINAMICALLY_INSERTED_STK_TABLES = [
  { class: HidrografiniaiGpoPlotiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Hidrografiniai_GPO_Plot.shp" },
  { class: GeomorfologiniaiGpoPlotiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geomorfologiniai_GPO_Plot.shp" },
  { class: HidrogeologiniaiGpoPlotiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Hidrogeologiniai_GPO_Plot.shp" },
  { class: BotaniniaiGpoPlotiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Botaniniai_GPO_Plot.shp" },
  { class: BotaniniaiGpoTaskiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Botaniniai_GPO_Task.shp" },
  { class: ZoologiniaiGpoPlotiniai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Zoologiniai_GPO_Plot.shp" },
  { class: StkSklypai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Sklypai.shp" },
  { class: StkParkai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Parkai.shp" },
  { class: BiosferosRezervatai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BiosferosRezervatai.shp" },
  { class: BiosferosPoligonai,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BiosferosPoligonai.shp" },
  { class: FunkcinioPrioritetoZonos,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/FunkcinioPrioritetoZonos.shp" },
  { class: BuferinesApsaugosZonos,
    file_location: "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BuferinesApsaugosZonos.shp" }
].freeze

MANUALLY_INSERTED_STK_TABLES.each do |table_hash|
  next unless table_hash[:class].count.zero?

  puts "seeding seeding STK #{table_hash[:class]}"

  ReadShapeFiles.run(table_hash[:class], table_hash[:file_location], true)

  puts 'Great Success!'
end

DINAMICALLY_INSERTED_STK_TABLES.each do |table_hash|
  next unless table_hash[:class].count.zero?

  puts "seeding seeding STK #{table_hash[:class]}"

  ReadShapeFiles.run(table_hash[:class], table_hash[:file_location], false)

  puts 'Great Success!'
end

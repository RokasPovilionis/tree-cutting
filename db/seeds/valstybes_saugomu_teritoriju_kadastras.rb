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

MANUALLY_INSERTED_STK_TABLES.each do |table_hash|
  table_hash[:class].count.zero?

  puts "seeding seeding STK #{table_hash[:class]}"

  ReadShapeFiles.run(table_hash[:class], table_hash[:file_location], true)

  puts 'Great Success!'
end

if HidrografiniaiGpoPlotiniai.count.zero?
  puts 'seeding STK Hidrografiniai gamtos paveldo objektai plotiniai'

  ReadShapeFiles.run(
    HidrografiniaiGpoPlotiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Hidrografiniai_GPO_Plot.shp",
    false
  )

  puts 'Great Success!'
end

if GeomorfologiniaiGpoPlotiniai.count.zero?
  puts 'seeding STK Geomorfologiniai gamtos paveldo objektai plotiniai'

  ReadShapeFiles.run(
    GeomorfologiniaiGpoPlotiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geomorfologiniai_GPO_Plot.shp",
    false
  )

  puts 'Great Success!'
end

if HidrogeologiniaiGpoPlotiniai.count.zero?
  puts 'seeding STK Hidrogeologiniai gamtos paveldo objektai plotiniai'

  ReadShapeFiles.run(
    HidrogeologiniaiGpoPlotiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Hidrogeologiniai_GPO_Plot.shp",
    false
  )

  puts 'Great Success!'
end

if BotaniniaiGpoPlotiniai.count.zero?
  puts 'seeding STK Botaniniai gamtos paveldo objektai plotiniai'

  ReadShapeFiles.run(
    BotaniniaiGpoPlotiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Botaniniai_GPO_Plot.shp",
    false
  )

  puts 'Great Success!'
end

if BotaniniaiGpoTaskiniai.count.zero?
  puts 'seeding STK Botaniniai gamtos paveldo objektai taskiniai'

  ReadShapeFiles.run(
    BotaniniaiGpoTaskiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Botaniniai_GPO_Task.shp",
    false
  )

  puts 'Great Success!'
end

if ZoologiniaiGpoPlotiniai.count.zero?
  puts 'seeding STK Zoologiniai gamtos paveldo objektai plotiniai'

  ReadShapeFiles.run(
    ZoologiniaiGpoPlotiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Zoologiniai_GPO_Plot.shp",
    false
  )

  puts 'Great Success!'
end

if StkSklypai.count.zero?
  puts 'seeding STK sklypai'

  ReadShapeFiles.run(
    StkSklypai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Sklypai.shp",
    false
  )

  puts 'Great Success!'
end

if StkParkai.count.zero?
  puts 'seeding STK Parkai'

  ReadShapeFiles.run(
    StkParkai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Parkai.shp",
    false
  )

  puts 'Great Success!'
end

if BiosferosRezervatai.count.zero?
  puts 'seeding STK Biosferos Rezervatai'

  ReadShapeFiles.run(
    BiosferosRezervatai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BiosferosRezervatai.shp",
    false
  )

  puts 'Great Success!'
end

if BiosferosPoligonai.count.zero?
  puts 'seeding STK Biosferos Poligonai'

  ReadShapeFiles.run(
    BiosferosPoligonai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BiosferosPoligonai.shp",
    false
  )

  puts 'Great Success!'
end

if FunkcinioPrioritetoZonos.count.zero?
  puts 'seeding STK Funkcinio Prioriteto Zonos'

  ReadShapeFiles.run(
    FunkcinioPrioritetoZonos,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/FunkcinioPrioritetoZonos.shp",
    false
  )

  puts 'Great Success!'
end

if BuferinesApsaugosZonos.count.zero?
  puts 'seeding STK Buferines Apsaugos Zonos'

  ReadShapeFiles.run(
    BuferinesApsaugosZonos,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/BuferinesApsaugosZonos.shp",
    false
  )

  puts 'Great Success!'
end

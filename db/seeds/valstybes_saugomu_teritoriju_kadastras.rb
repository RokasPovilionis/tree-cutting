# frozen_string_literal: true

if Rezervatas.count.zero?
  puts 'seeding STK rezervatai'

  ReadShapeFiles.run(Rezervatas, "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Rezervatai.shp", true)

  puts 'Great Success!'
end

if Draustinis.count.zero?
  puts 'seeding STK draustiniai'

  ReadShapeFiles.run(Draustinis, "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Draustiniai.shp", true)

  puts 'Great Success!'
end

if GeologiniaiGpoPlotiniai.count.zero?
  puts 'seeding STK Geologiniai gamtos paveldo objektai plotiniai'

  ReadShapeFiles.run(
    GeologiniaiGpoPlotiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geologiniai_GPO_Plot.shp",
    true
  )

  puts 'Great Success!'
end

if GeologiniaiGpoTaskiniai.count.zero?
  puts 'seeding STK Geologiniai gamtos paveldo objektai taskiniai'

  ReadShapeFiles.run(
    GeologiniaiGpoTaskiniai,
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Geologiniai_GPO_Task.shp",
    true
  )

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

# frozen_string_literal: true

if Rezervatas.count.zero?
  puts 'seeding STK rezervatai'

  ReadShapeFiles.run(Rezervatas, "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Rezervatai.shp")

  puts 'Great Success!'
end

if Draustinis.count.zero?
  puts 'seeding STK draustiniai'

  ReadShapeFiles.run(Draustinis, "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/Draustiniai.shp")

  puts 'Great Success!'
end

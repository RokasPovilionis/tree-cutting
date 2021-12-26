# frozen_string_literal: true

# for testing purpouses use this:

# def bad_leidimai
#   Leidimas.all.each do |leidimas|
#     leidimas.sklypai.split(',').map do |number|
#       if number.include?('-')
#         puts leidimas.sklypai
#       elsif number.to_i.digits.length > 3
#         puts leidimas.sklypai
#       end
#     end
#   end
#   nil
# end

# previous bad leidimu sklypai:

# 3435
# 1017
# 16,1719,23
# 23a,31,32a,33a,33b,3536a,36b
# 25,27,27b,28,2930
# 3438

require 'csv'

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

# Leidimas.delete_all

def row_to_hash(row)
  {
    serija_ir_nr: row[0],
    regionas: row[1],
    rajonas: row[2],
    nuosavybes_forma: row[3],
    uredija: row[4],
    girkininkija: row[5],
    kvartalas: row[6],
    sklypai: row[7],
    plotas: row[8],
    kad_vietove: row[9],
    kad_blokas: row[10],
    kad_nr: row[11],
    kirtimo_rusis: row[12],
    galiojimo_padzia: row[13],
    galiojimo_pabaiga: row[14],
    created_at: Time.now.utc.iso8601,
    updated_at: Time.now.utc.iso8601
  }
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

def parse_bad_sklypai(numbers)
  parsed_numbers = numbers.split(',').map do |number|
    if number.include?('-')
      (number.split('-').first..number.split('-').last).to_a
    elsif number.to_i.digits.length > 3
      [number[0..1], number[2...]]
    else
      number
    end
  end
  parsed_numbers.join(',')
end

if Leidimas.all.count.zero?
  file_nr = 0
  Dir[File.join(Rails.root, 'db', 'leidimai', '*.csv')].sort.each do |leidimu_file|
    puts "file number #{file_nr}"
    leidimai = []
    CSV.foreach(leidimu_file, col_sep: ', ') do |row|
      row[7] = parse_bad_sklypai(row[7])
      leidimai << row_to_hash(row)
    end
    Leidimas.insert_all(leidimai)
    file_nr += 1
  end
end

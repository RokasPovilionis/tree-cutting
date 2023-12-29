# frozen_string_literal: true

# Class used to parse xlsx files with permit data
class Permit::ParseXlsx
  include Interactor::Initializer

  BATCH_SIZE = 1000

  def run
    xlsx = Roo::Excelx.new("#{Rails.root}/db/permit_xlsx/permits.xlsx")

    row_number = 1
    xlsx.each_row_streaming(offset: 4) do |row|
      Leidimas.find_or_create_by(PermitParser.for(row_to_model_attributes(row)))
      puts "Row #{row_number} processed"
      row_number += 1
    end
  end

  private

  def row_to_model_attributes(row)
    {
      serija_ir_nr: row[0].value,
      vmu_padalinys: row[1].value,
      girininkija: row[2].value,
      nuosavybes_forma: row[3].value,
      kvartalas: row[4].value,
      sklypai: row[5].value,
      plotas: row[6].value,
      kad_vietove: row[7].value,
      kad_blokas: row[8].value,
      kad_nr: row[9].value,
      kirtimo_rusis: row[10].value,
      galiojimo_pradzia: row[11].value,
      galiojimo_pabaiga: row[12].value,
      kadastrinis_sklypas: row[13].value,
      galiojimas: row[14].value
    }
  end
end

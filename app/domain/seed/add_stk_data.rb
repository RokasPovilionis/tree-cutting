# frozen_string_literal: true

# Class used to add data to the STK tables
class Seed::AddStkData
  include Interactor::Initializer

  STK_TABLES = [
    { class: Bast, file_name: 'Bast' },
    { class: Past, file_name: 'Past' },
    { class: Rezervatas, file_name: 'Rezervatai' },
    { class: Draustinis, file_name: 'Draustiniai' },
    { class: GeologiniaiGpoPlotiniai, file_name: 'Geologiniai_GPO_Plot' },
    { class: GeologiniaiGpoTaskiniai, file_name: 'Geologiniai_GPO_Task' },
    { class: HidrografiniaiGpoPlotiniai, file_name: 'Hidrografiniai_GPO_Plot' },
    { class: GeomorfologiniaiGpoPlotiniai, file_name: 'Geomorfologiniai_GPO_Plot' },
    { class: HidrogeologiniaiGpoPlotiniai, file_name: 'Hidrogeologiniai_GPO_Plot' },
    { class: BotaniniaiGpoPlotiniai, file_name: 'Botaniniai_GPO_Plot' },
    { class: BotaniniaiGpoTaskiniai, file_name: 'Botaniniai_GPO_Task' },
    { class: ZoologiniaiGpoPlotiniai, file_name: 'Zoologiniai_GPO_Plot' },
    { class: StkSklypai, file_name: 'Sklypai' },
    { class: StkParkai, file_name: 'Parkai' },
    { class: BiosferosRezervatai, file_name: 'BiosferosRezervatai' },
    { class: BiosferosPoligonai, file_name: 'BiosferosPoligonai' },
    { class: FunkcinioPrioritetoZonos, file_name: 'FunkcinioPrioritetoZonos' },
    { class: BuferinesApsaugosZonos, file_name: 'BuferinesApsaugosZonos' }
  ].freeze

  def run
    # STK_TABLES.each { |table| table[:class].delete_all }

    insert_stk_data
  end

  private

  def insert_stk_data
    STK_TABLES.each do |table_hash|
      next unless table_hash[:class].count.zero?

      puts "seeding seeding STK #{table_hash[:class]}"

      Seed::ReadShapeFiles.run(table_hash[:class], file_location(table_hash[:file_name]))

      puts 'Great Success!'
    end
  end

  def file_location(file_name)
    "#{Rails.root}/db/valstybes_saugomu_teritoriju_kadastras/#{file_name}.shp"
  end
end

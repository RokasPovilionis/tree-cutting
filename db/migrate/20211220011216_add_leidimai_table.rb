# frozen_string_literal: true

# Adds leidimai table
class AddLeidimaiTable < ActiveRecord::Migration[6.1]
  def change
    create_table :kirtimu_leidimai do |t|
      t.string :serija_ir_nr, null: false
      t.string :regionas, null: false
      t.string :rajonas, null: false
      t.string :nuosavybes_forma, null: false
      t.string :uredija, null: false
      t.string :girkininkija, null: false
      t.integer :kvartalas, null: false
      t.string :sklypai, null: false
      t.integer :plotas, null: false
      t.integer :kad_vietove, null: false
      t.integer :kad_blokas, null: false
      t.integer :kad_nr, null: false
      t.string :kirtimo_rusis, null: false
      t.string :galiojimo_padzia, null: false
      t.string :galiojimo_pabaiga, null: false
      t.timestamps
    end
  end
end

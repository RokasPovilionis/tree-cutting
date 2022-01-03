# frozen_string_literal: true

# Adds more needed indexes
class AddMoreIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :uredijos, :pavadinimas
    add_index :girininkijos, :pavadinimas
  end
end

# frozen_string_literal: true

# Adds needed indexes
class AddNeededIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :uredijos, %i[mu_kod], unique: true
    add_index :girininkijos, %i[mu_kod gir_kod], unique: true
    add_index :kvartalai, %i[mu_kod gir_kod kv_nr], unique: true
    add_index :sklypai, %i[mu_kod gir_kod kv_nr skl_nr], unique: true
  end
end

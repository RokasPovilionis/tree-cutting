# frozen_string_literal: true

# Adds missing geom indexes
class AddMissingIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :girininkijos, :geom, using: :gist
    add_index :kvartalai, :geom, using: :gist
    add_index :sklypai, :geom, using: :gist
    add_index :valst_r_miskai, :geom, using: :gist
    add_index :misku_pogrupiai, :geom, using: :gist
    add_index :kmb_geoobjektas, :geom, using: :gist
  end
end

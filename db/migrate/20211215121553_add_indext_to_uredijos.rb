# frozen_string_literal: true

# Adds geom index
class AddIndextToUredijos < ActiveRecord::Migration[6.1]
  def change
    add_index :uredijos, :geom, using: :gist
  end
end

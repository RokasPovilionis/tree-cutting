# frozen_string_literal: true

# Adds z dimension to Uredijos
class AddZDimensionToUredijos < ActiveRecord::Migration[6.1]
  def change
    change_column :uredijos, :geom, :multi_polygon, srid: 4326, has_z: true
  end
end

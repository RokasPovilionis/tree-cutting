# frozen_string_literal: true

# Adds m dimension to Uredijos
class AddMDimensionToUredijos < ActiveRecord::Migration[6.1]
  def change
    change_column :uredijos, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
  end
end

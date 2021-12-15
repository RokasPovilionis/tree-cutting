# frozen_string_literal: true

# Adds missing z and m dimensions
class AddMissingDimensions < ActiveRecord::Migration[6.1]
  def change
    change_column :uredijos, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
    change_column :girininkijos, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
    change_column :kvartalai, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
    change_column :sklypai, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
    change_column :valst_r_miskai, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
    change_column :misku_pogrupiai, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
    change_column :kmb_geoobjektas, :geom, :multi_polygon, srid: 4326, has_z: true, has_m: true
  end
end

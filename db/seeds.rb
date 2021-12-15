# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Uredija.delete_all
Girininkija.delete_all

connection = ActiveRecord::Base.connection()

if Uredija.all.count.zero?

  # Import uredija data from shpfile to uredijos table
  from_uredijos_shp_sql =
    `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'Uredija.shp')} uredijos_ref`
  connection.execute 'drop table if exists uredijos_ref'
  connection.execute from_uredijos_shp_sql
  connection.execute <<-SQL
      insert into uredijos(mu_kod, pavadinimas, geom, created_at, updated_at)
        select mu_kod, pavadinima, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from uredijos_ref
  SQL
  connection.execute 'drop table uredijos_ref'
end

if Girininkija.all.count.zero?

  # Import uredija data from shpfile to uredijos table
  from_girininkijos_shp_sql =
    `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'Girininkija.shp')} girininkijos_ref`
  connection.execute 'drop table if exists girininkijos_ref'
  connection.execute from_girininkijos_shp_sql
  connection.execute <<-SQL
    insert into girininkijos(mu_kod, gir_kod, pavadinimas, geom, created_at, updated_at)
      select mu_kod, gir_kod, pavadinima, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from girininkijos_ref
  SQL
  connection.execute 'drop table girininkijos_ref'
end

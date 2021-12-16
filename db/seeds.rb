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
Kvartalas.delete_all
Sklypas.delete_all

connection = ActiveRecord::Base.connection()

if Uredija.all.count.zero?

  # Import uredija data from shpfile to uredijos table
  puts 'seeding uredijos'

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

  # Import girininkija data from shpfile to girinkijos table
  puts 'seeding girininkijos'

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

if Kvartalas.all.count.zero?

  # Import kvartalas data from shpfile to kvartalai table
  puts 'seeding kvartalai'

  from_kvartalai_shp_sql =
    `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shpfiles', 'Kvartalas.shp')} kvartalai_ref`
  connection.execute 'drop table if exists kvartalai_ref'
  connection.execute from_kvartalai_shp_sql
  connection.execute <<-SQL
    insert into kvartalai(mu_kod, gir_kod, kv_nr, geom, created_at, updated_at)
      select mu_kod, gir_kod, kv_nr, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from kvartalai_ref
  SQL
  connection.execute 'drop table kvartalai_ref'
end

if Sklypas.all.count.zero?

  RGeo::Shapefile::Reader.open("#{Rails.root}/db/shpfiles/Sklypas.shp") do |file|
    puts "File contains #{file.num_records} records."
    values = []

    file.each do |record|
      bonus_params = {
        geom: record.geometry,
        created_at: Time.now.utc.iso8601,
        updated_at: Time.now.utc.iso8601
      }

      values << record.attributes.except('Shape_Leng', 'Shape_Area').transform_keys(&:downcase).merge!(bonus_params)

      puts "collected #{record.index + 1} sklypai" if (record.index + 1 % 5_000).zero?
    end

    values.each_slice(5000) { |slice| Sklypas.insert_all(slice) }

    puts 'Great Success!'
  end

  RGeo::Shapefile::Reader.open("#{Rails.root}/db/shpfiles/Sklypas2.shp") do |file|
    puts "File contains #{file.num_records} records."
    values = []

    file.each do |record|
      bonus_params = {
        geom: record.geometry,
        created_at: Time.now.utc.iso8601,
        updated_at: Time.now.utc.iso8601
      }

      values << record.attributes.except('Shape_Leng', 'Shape_Area').transform_keys(&:downcase).merge!(bonus_params)

      puts "collected #{record.index + 1}" if (record.index + 1 % 5_000).zero?
    end

    values.each_slice(5000) { |slice| Sklypas.insert_all(slice) }

    puts 'Great Success!'
  end
end

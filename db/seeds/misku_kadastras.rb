# frozen_string_literal: true

# Uredija.delete_all
# Girininkija.delete_all
# Kvartalas.delete_all
# Sklypas.delete_all
# ValstybinisMiskas.delete_all
# MiskuPogrupis.delete_all
# KmbGeoobjektas.delete_all

connection = ActiveRecord::Base.connection()

if Uredija.all.count.zero?

  # Import uredija data from shpfile to uredijos table
  puts 'seeding uredijos'

  from_uredijos_shp_sql =
    `shp2pgsql -c -g geom -W windows-1257 -s 4326 #{Rails.root.join('db', 'shpfiles', 'Uredija.shp')} uredijos_ref`
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
    `shp2pgsql -c -g geom -W windows-1257 -s 4326 #{Rails.root.join('db', 'shpfiles', 'Girininkija.shp')} girininkijos_ref`
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

      puts "collected #{record.index + 1} sklypai" if ((record.index + 1) % 5_000).zero?
    end

    slice_nr = 0
    values.each_slice(5000) do |slice|
      Sklypas.insert_all(slice)
      puts "Slice nr #{slice_nr} inserted"
      slice_nr += 1
    end

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

      puts "collected #{record.index + 1}" if ((record.index + 1) % 5_000).zero?
    end

    slice_nr = 0
    values.each_slice(5000) do |slice|
      Sklypas.insert_all(slice)
      puts "Slice nr #{slice_nr} inserted"
      slice_nr += 1
    end

    puts 'Great Success!'
  end
end

if ValstybinisMiskas.all.count.zero?

  # Import valstybinis miskas data from shpfile to valstybiniai_r_miskai table
  puts 'seeding valst_r_miskai'

  shp_file_location = Rails.root.join('db', 'shpfiles', 'Valst_r_miskai.shp')
  from_valst_r_miskai_shp_sql =
    `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{shp_file_location} valst_r_miskai_ref`
  connection.execute 'drop table if exists valst_r_miskai_ref'
  connection.execute from_valst_r_miskai_shp_sql
  connection.execute <<-SQL
    insert into valst_r_miskai(mu, gir, kv, geo_kv, saviv, kv_saviv, pl, lrv_data, lrv_nr, geom, created_at, updated_at)
      select mu, gir, kv, geo_kv, saviv, kv_saviv, pl, lrv_data, lrv_nr, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from valst_r_miskai_ref
  SQL
  connection.execute 'drop table valst_r_miskai_ref'
end

if MiskuPogrupis.all.count.zero?

  # Import misku pogrupis data from shpfile to misku_pogrupiai table
  puts 'seeding misku_pogrupiai'

  shp_file_location = Rails.root.join('db', 'shpfiles', 'Misku_pogrupiai.shp')
  from_misku_pogrupiai_shp_sql =
    `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{shp_file_location} misku_pogrupiai_ref`
  connection.execute 'drop table if exists misku_pogrupiai_ref'
  connection.execute from_misku_pogrupiai_shp_sql
  connection.execute <<-SQL
    insert into misku_pogrupiai(mu, saviv, lrv_data, lrv_nr, grupe, pogrupis, geom, created_at, updated_at)
      select mu, saviv, lrv_data, lrv_nr, grupe, pogrupis, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from misku_pogrupiai_ref
  SQL
  connection.execute 'drop table misku_pogrupiai_ref'
end

if KmbGeoobjektas.all.count.zero?

  # Import kmb geoobjektas data from shpfile to kmb_geoobjektas table
  puts 'seeding kmb_geoobjektas'

  shp_file_location = Rails.root.join('db', 'shpfiles', 'KMB_geoobjektas.shp')
  from_kmb_geoobjektas_shp_sql =
    `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{shp_file_location} kmb_geoobjektas_ref`
  connection.execute 'drop table if exists kmb_geoobjektas_ref'
  connection.execute from_kmb_geoobjektas_shp_sql
  connection.execute <<-SQL
    insert into kmb_geoobjektas(kmb_kod, ur, gir, kmb_tip_kod, pot_kmb_tip_kod, pastabos, geom, created_at, updated_at)
      select kmb_kod, ur, gir, kmb_tip_ko, pot_kmb_ti, pastabos, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from kmb_geoobjektas_ref
  SQL
  connection.execute 'drop table kmb_geoobjektas_ref'
end

# frozen_string_literal: true

namespace :gis_test_task do
  desc 'creates json for Uredija'
  task create_json: :environment do
    require 'rgeo'

    puts 'Getting data for Uredija'
    uredija = Uredija.first
    puts 'Creating RGeo factory'
    factory = RGeo::GeoJSON::EntityFactory.instance
    puts 'Creating feature'
    feature = factory.feature uredija.geom
    puts 'Generating hash'
    hash = RGeo::GeoJSON.encode feature
    puts 'Writing JSON file'
    File.open('public/uredija.json', 'w') { |file| file.write hash.to_json }
  end

  desc 'creates json for Uredija girininkijos'
  task create_state_json: :environment do
    require 'rgeo'

    puts 'Getting data for all the girininkijos'
    girininkijos = Girininkija.where(mu_kod: '28')
    puts 'Creating RGeo factory'
    factory = RGeo::GeoJSON::EntityFactory.instance

    girininkijos.each do |g|
      puts "Creating feature for #{g.hasc_code}"
      feature = factory.feature g.geom
      puts 'Generating hash'
      hash = RGeo::GeoJSON.encode feature
      puts 'Writing JSON file'
      File.open("public/druskininku_girininkija_#{g.id}.json", 'w') { |file| file.write hash.to_json }
    end
  end
end

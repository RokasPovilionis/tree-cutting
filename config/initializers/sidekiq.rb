# frozen_string_literal: true

require 'sidekiq'

schedule_file = 'config/schedule.yml'
Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379'),
    ssl_params: {
      verify_mode: OpenSSL::SSL::VERIFY_NONE
    }
  }
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379'),
    ssl_params: {
      verify_mode: OpenSSL::SSL::VERIFY_NONE
    }
  }
end

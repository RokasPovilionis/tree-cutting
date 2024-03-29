# frozen_string_literal: true

$redis = Redis.new(
  {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379'),
    ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
  }
)

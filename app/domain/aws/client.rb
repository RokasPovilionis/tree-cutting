# frozen_string_literal: true

# Class used to interact with AWS
class Aws::Client
  def get_object(object_key)
    client.get_object(bucket: ENV.fetch('BUCKET'), key: object_key).body
  end

  def client
    @client ||= Aws::S3::Client.new
  end
end

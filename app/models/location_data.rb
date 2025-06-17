class LocationData < ApplicationRecord
  belongs_to :user
  # Attributes: id, user_id, country, address, created_at, updated_at
end

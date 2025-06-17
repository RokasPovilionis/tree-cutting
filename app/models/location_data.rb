class LocationData < ApplicationRecord
  belongs_to :user

  validates :country, presence: true
  validates :address, presence: true
end

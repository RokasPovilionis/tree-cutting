# frozen_string_literal: true

# Model for user saved searches
class UserSavedSearch < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :search_name, presence: true
  validates :search_params, presence: true
end

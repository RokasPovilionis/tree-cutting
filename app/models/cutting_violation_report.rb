# frozen_string_literal: true

# Model for Cutting violation reports
class CuttingViolationReport < ApplicationRecord
  has_one :cutting_permit
  has_one :user
  has_one_attached :violation_image
end

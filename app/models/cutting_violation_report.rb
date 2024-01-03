# frozen_string_literal: true

# Model for Cutting violation reports
class CuttingViolationReport < ApplicationRecord
  belongs_to :leidimas
  belongs_to :user
  has_one_attached :violation_image

  def violation_image_url
    violation_image.service.send(:object_for, violation_image.key).public_url
  end
end

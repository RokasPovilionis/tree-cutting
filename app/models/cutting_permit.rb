# frozen_string_literal: true

# Model for Cutting permits
class CuttingPermit < ApplicationRecord
  has_many :cutting_violation_reports, dependent: :destroy
end

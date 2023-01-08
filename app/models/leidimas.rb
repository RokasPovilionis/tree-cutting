# frozen_string_literal: true

# Model for kirtimu leidimai
class Leidimas < ApplicationRecord
  self.table_name = 'kirtimu_leidimai'

  after_create :create_permit_plots

  def create_permit_plots
    PopulatePermitPlotConnections.for(self)
  end
end

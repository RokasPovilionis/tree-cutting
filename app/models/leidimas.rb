# frozen_string_literal: true

# Model for kirtimu leidimai
class Leidimas < ApplicationRecord
  self.table_name = 'kirtimu_leidimai'

  has_many :cutting_violation_reports, dependent: :destroy

  after_create :create_permit_plots
  after_create :notify_subscribers

  def create_permit_plots
    PopulatePermitPlotConnections.for(self)
  end

  def notify_subscribers
    SendNotificationsToSubscribers.for([self])
  end
end

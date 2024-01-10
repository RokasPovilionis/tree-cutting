# frozen_string_literal: true

# Class used for sending emails to subscribed users
class SendEmailsJob < ApplicationJob
  queue_as :low_priority

  def perform
    SendNotificationsToSubscribers.for(leidimai)
  end

  private

  def leidimai
    @leidimai ||= Leidimas.where(is_notification_sent: false)
  end
end

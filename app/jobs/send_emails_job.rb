# frozen_string_literal: true

# Class used for sending emails to subscribed users
class SendEmailsJob < ApplicationJob
  queue_as :low_priority

  def perform
    leidimai.each do |leidimas|
      relevant_subscriptions =
        subscriptions_by_pair[[leidimas.girininkija, leidimas.kvartalas] || [leidimas.girininkija, nil]]

      relevant_subscriptions.each { |subscription| deliver_email(subscription.user) } if relevant_subscriptions.present?

      leidimas.update(is_notification_sent: true)
    end
  end

  private

  def deliver_email(user)
    PermitSubscriptionMailer.permit_subscription_email(user).deliver_later
  end

  def subscriptions_by_pair
    subscriptions.group_by { |subscription| [subscription.girininkija, subscription.kvartalas] }
  end

  def subscriptions
    PermitLocationSubscription
      .where(girininkija: girininkija_and_kvartalas_pairs.map(&:first))
      .where('kvartalas IS NULL OR kvartalas IN (?)', girininkija_and_kvartalas_pairs.map(&:second))
  end

  def girininkija_and_kvartalas_pairs
    leidimai.pluck(:girininkija, :kvartalas).uniq
  end

  def leidimai
    @leidimai ||= Leidimas.where(is_notification_sent: false)
  end
end

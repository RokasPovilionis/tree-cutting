# frozen_string_literal: true

# Class used to send all notifications to subscribers
class SendNotificationsToSubscribers
  include Interactor::Initializer

  initialize_with :leidimai

  def run
    leidimai.each do |leidimas|
      relevant_subscriptions =
        subscriptions_by_pair[[leidimas.girininkija, leidimas.kvartalas]] || subscriptions_by_pair[[leidimas.girininkija, nil]]

      if relevant_subscriptions.present?
        relevant_subscriptions.each { |subscription| deliver_email(subscription.user, leidimas.id) }
      end

      leidimas.update(is_notification_sent: true)
    end
  end

  private

  def deliver_email(user, leidimas_id)
    PermitSubscriptionMailer.permit_subscription_email(user, leidimas_id).deliver_now
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
end

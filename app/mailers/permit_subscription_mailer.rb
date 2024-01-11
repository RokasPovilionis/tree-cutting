# frozen_string_literal: true

# class used for sending emails for users that are subcribed to some region
class PermitSubscriptionMailer < ApplicationMailer
  def permit_subscription_email(user, leidimas_id)
    @user = user
    @leidimas_id = leidimas_id
    mail(to: @user.email, subject: 'Naujas leidimas buvo pridėtas jūsų prenumeruojamai teritorijai')
  end
end

# frozen_string_literal: true

# class used for sending emails for users that are subcribed to some region
class PermitSubscriptionMailer < ApplicationMailer
  def permit_subscription_email(user)
    @user = user
    mail(to: @user.email, subject: 'Naujas leidimas buvo pridėtas jūsų prenumeruojamai teritorijai')
  end
end

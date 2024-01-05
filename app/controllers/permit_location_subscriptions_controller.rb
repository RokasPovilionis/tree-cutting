# frozen_string_literal: true

# Controller for permit locations
class PermitLocationSubscriptionsController < ApplicationController
  def new
    @permit_location_subscription = PermitLocationSubscription.new
  end

  def create
    @permit_location_subscription = PermitLocationSubscription.new(
      permit_location_subscription_params.merge({ user_id: current_user.id })
    )

    if @permit_location_subscription.save
      redirect_to leidimai_index_path
    else
      render new_permit_location_subscription_path
    end
  end

  private

  def permit_location_subscription_params
    params.require(:permit_location_subscription).permit(:girininkija, :kvartalas)
  end
end

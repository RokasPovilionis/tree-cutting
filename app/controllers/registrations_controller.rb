# frozen_string_literal: true

# Controller for registration screen
class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authorized

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end

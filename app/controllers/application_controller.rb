# frozen_string_literal: true

# Base controller for the Application
class ApplicationController < ActionController::Base
  before_action :authorized, unless: :devise_controller?

  def authorized
    redirect_to root_path unless user_signed_in?
  end
end

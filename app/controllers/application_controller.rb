class ApplicationController < ActionController::Base
  def authorized
    redirect_to root_path unless user_signed_in?
  end
end

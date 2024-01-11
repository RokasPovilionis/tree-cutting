# frozen_string_literal: true

# Controller for user saved searches
class UserSavedSearchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new_saved_search
    session[:search_params] = params.except(:authenticity_token, :commit, :controller, :action).to_s
    redirect_to new_user_saved_search_path
  end

  def new
    @user_saved_search = UserSavedSearch.new
  end

  def create
    UserSavedSearch.create(
      user_id: current_user.id,
      search_name: saved_search_name,
      search_params: session[:search_params]
    )

    redirect_to maps_path
  end

  private

  def saved_search_name
    params[:user_saved_search][:search_name]
  end
end

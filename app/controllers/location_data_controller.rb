class LocationDataController < ApplicationController
  def index
    @location_data = LocationData.where(user_id: params[:user_id])
    render :index
  end

  def show
    @location_data = LocationData.find(params[:id])
    render :show
  end

  # Add other CRUD actions as needed
end

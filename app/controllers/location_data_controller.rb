class LocationDataController < ApplicationController
  before_action :set_location_data, only: [:show, :edit, :update, :destroy]

  def index
    @location_data = LocationData.all
  end

  def show
  end

  def new
    @location_data = LocationData.new
  end

  def create
    @location_data = LocationData.new(location_data_params)
    @location_data.user = current_user
    if @location_data.save
      redirect_to @location_data, notice: 'Location data was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location_data.update(location_data_params)
      redirect_to @location_data, notice: 'Location data was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @location_data.destroy
    redirect_to location_data_index_url, notice: 'Location data was successfully destroyed.'
  end

  private
    def set_location_data
      @location_data = LocationData.find(params[:id])
    end

    def location_data_params
      params.require(:location_data).permit(:country, :address)
    end
end

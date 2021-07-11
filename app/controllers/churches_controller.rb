class ChurchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @churches = Church.all

    @markers = @churches.geocoded.map do |church|
      {
        lat: church.latitude,
        lng: church.longitude
      }
    end
  end

  def show
    @church = Church.find(params[:id])
    @markers = [
      {
        lat: @church.latitude,
        lng: @church.longitude
      }]
  end

  def new
  end

  def update
  end
end

class ChurchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      # @churches = Church.all.search_by_location(params[:query])
      @churches = Church.near(params[:query], 10)
    else
      @churches = Church.all
    end

    @markers = @churches.geocoded.map do |church|
      {
        lat: church.latitude,
        lng: church.longitude,
        info_window: render_to_string(partial: "info_window", locals: { church: church })
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

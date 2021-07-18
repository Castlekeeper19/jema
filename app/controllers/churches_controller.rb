class ChurchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_church, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      # @churches = Church.all.search_by_location(params[:query])
      @churches = Church.near(params[:query], 5, limit: 10)

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

    @markers = [
      {
        lat: @church.latitude,
        lng: @church.longitude
      }]
  end

  def new
    @church = Church.new

  end

  def create
    @church = Church.new(church_params)
    @church.geocode
    if @church.save
      redirect_to churches_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @church.update(church_params)
      redirect_to church_path(@church)
      else
        render :edit
    end
  end



  private

  def set_church
    @church = Church.find(params[:id])
  end

  def church_params
    params.require(:church).permit(:name, :address1, :address2, :city, :prefecture, :post_code, :pastor, :website, :photo)
  end
end

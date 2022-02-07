class ChurchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_church, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      sql_query = " \
        churches.name @@ :query \
      "
      @churches = policy_scope(Church).where(sql_query, query: "%#{params[:query]}%")

    elsif params[:location].present?
      @churches = policy_scope(Church).near(params[:location], 5, limit: 10)
    else
      @churches = policy_scope(Church).order(name: :desc)
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
    @services = Service.where(church_id: @church.id)
    @markers = [
      {
        lat: @church.latitude,
        lng: @church.longitude
      }]
  end

  def new
    @church = Church.new
    authorize @church
  end

  def create
    @church = Church.new(church_params)
    @church.user = current_user
    authorize @church
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
    @church.geocode
    if @church.update(church_params)
      redirect_to church_path(@church)
      else
        render :edit
    end
  end



  private

  def set_church
    @church = Church.find(params[:id])
    authorize @church
  end

  def church_params
    params.require(:church).permit(:name, :address1, :address2, :city, :prefecture, :post_code, :pastor, :website, :photo)
  end
end

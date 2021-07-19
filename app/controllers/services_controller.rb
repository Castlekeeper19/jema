class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :update, :destroy]

  def new
    @church = Church.find(params[:church_id])
    @service = Service.new
  end

  def create

    @service = Service.new(service_params)
    @service.church = Church.find(params[:church_id])
    if @service.save
      redirect_to churches_path
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :start, :end, :day, :type, :language)
  end

end

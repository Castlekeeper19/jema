class MinistriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @jemas = Ministry.where(jema: true)
    @ministries = Ministry.where(jema: false)
  end

  def show
    @ministry = Ministry.find(params[:id])
  end
end

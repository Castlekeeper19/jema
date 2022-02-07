class MinistriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @jemas = policy_scope(Ministry).where(jema: true)
    @ministries = policy_scope(Ministry).where(jema: false)
  end

  def show
    @ministry = Ministry.find(params[:id])
    authorize @ministry
  end
end

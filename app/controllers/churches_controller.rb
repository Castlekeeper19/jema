class ChurchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @churches = Church.all
  end

  def show
  end

  def new
  end

  def update
  end
end

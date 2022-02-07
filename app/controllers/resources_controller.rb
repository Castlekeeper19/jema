class ResourcesController < ApplicationController
skip_before_action :authenticate_user!, only: [:growth, :care, :practical, :training]
before_action :skip_authorization
  def growth
  end

  def care
  end

  def practical
  end

  def training
  end

end

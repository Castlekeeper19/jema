class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :benefits, :contact ]

  def home
  end

  def about
  end

  def benefits
  end

  def contact
    @markers = [
      {
        lat: 35.699214,
        lng: 139.762686
      }]
  end
end

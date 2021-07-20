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
        lat: 35.698693,
        lng: 139.763000
      }]
  end
end

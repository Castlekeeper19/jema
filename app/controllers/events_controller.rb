class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
     if params[:query].present?
      sql_query = " \
        events.name @@ :query \
        OR events.location @@ :query \
        OR churches.name ILIKE :query \
      "
      @events = Event.joins(:church).where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.all
    end
  end

  def show

    @markers = [
      {
        lat: @event.church.latitude,
        lng: @event.church.longitude
      }]

  end

  def new
  end

  def update
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

end

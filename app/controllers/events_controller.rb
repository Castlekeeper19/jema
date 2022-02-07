class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
     if params[:query].present?
      sql_query = " \
        events.name @@ :query \
        OR events.location @@ :query \
        OR churches.name ILIKE :query \
      "
      @events = policy_scope(Event).joins(:church).where(sql_query, query: "%#{params[:query]}%")

    elsif params[:location].present?
       @events = policy_scope(Event).near(params[:location], 5, limit: 10)
    else
      @events = policy_scope(Event)
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
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.geocode
    authorize @event
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :description, :start, :photo, :location, :church_id)
  end

end

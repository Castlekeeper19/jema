class DashboardController < ApplicationController
  def index
    @my_churches = current_user.churches.all
    @my_events = current_user.events.all
  end

  def churches
    @my_churches = current_user.churches.all
  end

  def events
    @my_events = current_user.events.all
  end

  def ministires
  end

  def resources
  end
end

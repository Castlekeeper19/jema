class DashboardController < ApplicationController
  def index
    @my_churches = current_user.churches.all
    @my_events = current_user.events.all


  end
end

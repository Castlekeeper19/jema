class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :churches, :events, :ministries,:resouces ]

  def index
    @my_churches = policy_scope(current_user.churches).all
    @my_events = policy_scope(current_user.events).all
  end

  def churches
    @my_churches = policy_scope(current_user.churches).all
    if @my_churches.count > 0
      @my_churches.each do |church|
        authorize church
      end
    end

  end

  def events
    @my_events = current_user.events.all
  end

  def ministires
  end

  def resources
  end
end

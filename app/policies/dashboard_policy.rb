class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user==record.user
  end

  def churches?
    true
  end

  def events?
    user == record.user
  end

  def ministries?
  end

  def resources?
  end

end

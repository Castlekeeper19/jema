class ResourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def growth?
    true
  end

  def care
    true
  end

  def practical
    true
  end

  def training
    true
  end
end

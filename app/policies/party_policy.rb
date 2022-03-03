class PartyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    is_producer?
  end

  def create?
    is_producer?
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private
  def owner?
    @record.user == @user
  end

  def is_producer?
    @user.is_producer
  end
end

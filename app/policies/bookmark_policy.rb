class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
     def resolve
       scope.all
     end
  end

  def show?
    is_user?
  end

  def new?
    is_user?
  end

  def create?
    is_user?
  end

  private

  def is_user?
    !@user.is_producer
  end
end

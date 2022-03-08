class UsersController < ApplicationController
  def show
    if current_user.is_producer
      @parties = current_user.parties
      authorize @parties
    else
      @bookmarks = current_user.bookmarks
      authorize @bookmarks
    end
  end
end

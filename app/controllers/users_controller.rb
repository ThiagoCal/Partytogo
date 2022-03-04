class UsersController < ApplicationController

  def show
    @parties = current_user.parties
    authorize @parties
  end


end

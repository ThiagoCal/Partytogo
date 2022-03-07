class UsersController < ApplicationController
  def show
    @parties = current_user.parties
    @markers = Party.geocoded.map do |party|
      {
        lat: party.latitude,
        lng: party.longitude
      }
    end
    authorize @parties
  end
end

class UsersController < ApplicationController
  def show
    if current_user.is_producer
      @parties = current_user.parties
      authorize @parties
      @markers = Party.geocoded.map do |party|
        {
          lat: party.latitude,
          lng: party.longitude
        }
      end
    else
      @bookmarks = current_user.bookmarks
      authorize @bookmarks
    end
  end
end

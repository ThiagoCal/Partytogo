class PartiesDisplayController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index

    if params[:query].blank?
      @parties_display = policy_scope(Party)
    else
      @parties_display = policy_scope(Party.search(params[:query]))
      # the `geocoded` scope filters only parties_display with coordinates (latitude & longitude)
    end
    @markers = @parties_display.geocoded.map do |party|
      {
        lat: party.latitude,
        lng: party.longitude
      }
    end
  end

  private
    def party_params
      params.require(:party).permit(:user_id, :name, :photo, :address, :date, :category, :description, :rating, :price, :capacity, :is_active)
    end
end

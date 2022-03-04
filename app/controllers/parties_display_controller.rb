class PartiesDisplayController < ApplicationController

  def index
    @parties_display = policy_scope(Party)
    # the `geocoded` scope filters only parties_display with coordinates (latitude & longitude)
    @markers = Party.geocoded.map do |party|
      {
        lat: party.latitude,
        lng: party.longitude
      }
    end
  end

  def show
    @party_display = Party.find(params[:id])
    authorize @party_display
  end
end

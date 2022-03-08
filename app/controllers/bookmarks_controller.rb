class BookmarksController < ApplicationController

  def new

    @party = Party.find(params[:party_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @party = Party.find(params[:party_id])
    @bookmark = Bookmark.new
    authorize @bookmark
    @bookmark.user = current_user
    @bookmark.party = @party
    @bookmark.save
    redirect_to user_path(current_user)
  end

end

class BookmarksController < ApplicationController

  before_action :set_bookmark, only: :destroy
  before_action :set_party, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark.destroy

  def create
     @bookmark = Bookmark.new(bookmark_params)
     @bookmark.party = @party

    private

    def bookmark_params
      params.require(:bookmark).permit(:user_id, :party_id)
    end

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def set_party
      @party = party.find(params[:party_id])
    end
end

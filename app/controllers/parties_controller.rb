class PartiesController < ApplicationController
  before_action :set_party, only:[:edit, :update]
  def index
    @parties = policy_scope(Party).order(date: :DESC)
  end

  def new
    @user = User.find(params[:user_id])
    @party = Party.new
    authorize @party
  end

  def create
    @party = Party.new(party_params)
    @user = User.find(params[:user_id])
    @party.user = @user
    authorize @party
    @party.save
    redirect_to user_path(@user)
  end

  def edit
    authorize @party
  end

  def update
    authorize @party
    if @party.update(party_params) #this will already save your nested project along with the party
      redirect_to user_path(@party.user)
    else
      render :edit
    end
  end

  def destroy
    authorize @party
    @party.destroy
    redirect_to user_path(@party.user)
  end

  private
    def party_params
      params.require(:party).permit(:user_id, :name, :photo, :address, :date, :category, :description, :rating, :price, :capacity, :is_active)
    end

    def set_party
      @party = Party.find(params[:id])
    end
end

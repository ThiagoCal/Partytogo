class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def new
    @user = User.find(params[:user_id])
    @party = Party.new
  end

  def create
    @user = User.find(params[:user_id])
    @party = Party.new(party_params)
    if @party.save
      redirect_to user_path(@user)
    else
      :new
    end
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = party.find(params[:id])
    if @party.update(party_params) #this will already save your nested project along with the party
      redirect_to user_path(@party.user)
    else
      render :edit
    end
  end

  def destroy
    @party = party.find(params[:id])
    @party.destroy
    redirect_to user_path(@party.user)
  end

  private
    def party_params
      require.params(:party).permit(:user_id, :name, :address, :date, :category, :description, :rating, :price, :capacity, :is_active)
    end
end

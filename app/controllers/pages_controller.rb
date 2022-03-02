class PagesController < ApplicationController
  def home
    before_action :authenticate_user!
  end
end

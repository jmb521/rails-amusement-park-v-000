class AttractionsController < ApplicationController
  before_action :authenticate_user, only:[:show, :index]
  def index
    @attractions = Attraction.all

  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
    @user = User.find_by(id: params[:id])
  end
end

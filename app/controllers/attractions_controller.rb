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

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to edit_attraction_path
    end

  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end
  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end

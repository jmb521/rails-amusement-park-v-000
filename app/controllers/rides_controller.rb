class RidesController < ApplicationController

  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @message = @ride.take_ride
    @user = User.find_by(params[:id])
    @user.mood
    

    redirect_to user_path(@ride.user, :message => @message)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user, only:[:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user != @user
      if !current_user.admin
        redirect_to root_path
      end
    end

    @message = params[:message] if params[:message]
    @message ||= false

  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :height, :happiness, :admin, :tickets)
  end
end

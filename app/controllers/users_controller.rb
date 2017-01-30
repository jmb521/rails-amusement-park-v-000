class UsersController < ApplicationController
  before_action :authenticate_user, only:[:show, :edit]

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

    @message = params[:message] if params[:message]
    @message ||= false
    # if current_user != @user
    #   if !current_user.admin
    #     redirect_to root_path
    #   end
    # end

  end
  def edit
    @user = current_user
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :height, :happiness, :admin, :tickets)
  end
end

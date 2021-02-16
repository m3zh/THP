class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    else
      @user.update(user_params)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    else
      @user.destroy
    end
  end

 private

  def user_params
    params.require(:user).permit(:id, :email, :password)
  end

end

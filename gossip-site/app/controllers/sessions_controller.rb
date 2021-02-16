class SessionsController < ApplicationController

  before_action :authenticate_user, only: [:index]

  def index
  end

  def new
    @user = User.new(email: params['email'])
  end

  def create
    @user = User.find_by(email: params['email'])
    if @user && @user.authenticate(params['password'])
      session[:user_id] = @user.id
      redirect_to new_session_path
    else
      flash[:danger] = "Invalid email or password. Retry or go to sign up"
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:alert] = "Bye!"
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash.now[:danger] = "Please log in"
      redirect_to root_path
    end
  end

end

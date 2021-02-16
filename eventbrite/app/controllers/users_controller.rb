class UsersController < ApplicationController
  #before_action :authenticate_user!, only: [:show]
  before_action :same_user, only: [:update]
  before_action :current_user

  def show
    @user = User.find_by(id: params['id'])
  end

  private

  def same_user
    @user = User.find_by(id: params['id'])
    unless current_user.id == @user.id
      flash.now[:danger] = "Profile access denied"
      redirect_to '/'
    end
  end

end

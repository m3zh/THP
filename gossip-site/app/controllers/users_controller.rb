class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params['name'], email: params['email'],
      password: params['password'], last_name: "Brown",
      city: City.create(name: ['Paris','Berlin','Beijing','Dublin','Amsterdam','Oslo','Warsaw'].sample))
    if @user.save
      flash[:success] = "Account successfully created. Now log in"
      redirect_to root_path
    else
      flash[:alert]
      render 'new'
    end
  end

  def show
    @user = User.find(params['id'])
  end

  def edit
    @user = User.find(params['id'])
  end

  def update
    @user = User.find(params['id'])
    @user.update(post_params)
    redirect_to users_path
  end

  def destroy
    @user = User.find(params['id'])
    @user.destroy
    redirect_to users_path
  end

  private

  def post_params
    params.require(:user).permit(:title,:content)
  end

end

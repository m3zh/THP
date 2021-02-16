class CartsController < ApplicationController
  before_action :authenticate_user!

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create

  end

  def show
    @cart = Cart.find(params[:id])
    if !current_user?(@cart.user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    end
  end

  def index
    @carts = Cart.all
  end

  def edit
    @cart = Cart.find(params[:id])
    if !current_user?(@cart.user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if !current_user?(@cart.user)
      flash[:error] = "Vous n'êtes pas le bon utilisateur."
      redirect_to root_path
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

  private

  def cart_params
    params.require(:cart)
  end

end

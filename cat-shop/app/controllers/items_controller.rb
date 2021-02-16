class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:update]
  skip_before_action :verify_authenticity_token, :only => [:create]

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @cart = current_cart
    @cart.add_to_cart(params[:id])

    respond_to do |format|
      format.html  { redirect_to cart_path(@cart.id) }
      format.js  { }
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @cart = current_cart
    @cart.items.destroy(params[:id])


    respond_to do |format|
      format.html  { redirect_to cart_path(@cart.id) }
      format.js  { }
    end
  end

  private

  def item_params
    params.permit(:title, :price, :description, :photo)
  end

end

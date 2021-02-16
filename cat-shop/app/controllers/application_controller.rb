class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper

  def current_cart
    if current_user.cart.present?
      current_cart = current_user.cart
    else
      current_cart = Cart.create(user: current_user)
      session[:cart_id] = current_cart.id
      current_cart
    end
  end

end

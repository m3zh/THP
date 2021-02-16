# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :current_user, only: [:create,:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    #remember(current_user)
    cookies[:sign_in] = {
      value: "Cookies activated",
      expires: Time.now + 7.days,
      domain: 'localhost',
      secure: true
    }
    super
  end

  # DELETE /resource/sign_out
  def destroy
    cookies.delete(:sign_in, domain: 'localhost')
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

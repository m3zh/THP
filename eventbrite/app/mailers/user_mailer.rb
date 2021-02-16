class UserMailer < ApplicationMailer
  default from: 'millyla@hotmail.it'

  def welcome_email(user)
    @user = user
    @url = 'https://eventbrite2020.herokuapp.com/'
    mail(to: @user.email, subject: "Welcome")
  end

end

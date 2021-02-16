class UserMailer < ApplicationMailer
  default from: 'animalmatching2020@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://arcane-basin-51216.herokuapp.com/"
    mail(to: @user.email, subject: "Bienvenue sur Chatons!")
  end
end

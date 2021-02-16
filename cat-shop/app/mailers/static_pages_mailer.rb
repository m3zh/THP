class StaticPagesMailer < ApplicationMailer
    default from: 'animalmatching2020@gmail.com'

    def contact_email(name, email, subject, data)
        @user = name
        @user_email = email
        @body = data
        mail(to: 'animalmatching2020@yopmail.com', subject: subject)
    end
end

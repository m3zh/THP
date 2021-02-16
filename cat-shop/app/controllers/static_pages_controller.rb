class StaticPagesController < ApplicationController
  def about
  end

  def contact
    name = params[:name]
    email = params[:email]
    subject = params[:subject]
    data = params[:body]
    StaticPagesMailer.contact_email(name, email, subject, data).deliver
  end


end

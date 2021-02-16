class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.create(subject: Faker::TvShows::Simpsons.quote, body: Faker::TvShows::TheITCrowd.quote, read: false )
    puts "****"
    p @email.id

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.read = true

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.read = false

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end


end

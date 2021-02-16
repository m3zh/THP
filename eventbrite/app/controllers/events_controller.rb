class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :current_user, except: [:index,:show]
  before_action :is_admin?, only: [:update,:delete]

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(title: params['event']['title'],location: params['event']['location'],
    start_date: params['event']['start_date'], description: params['event']['description'],
    price: params['event']['price'], admin: current_user)
    if @event.save
      redirect_to '/events'
    end
  end

  def show
    @event = Event.find(params['id'])
  end

  def update
    @event = Event.find(params['id'])
  end

  def destroy
    @event = Event.find(params['id'])
    @event.delete
    flash[:danger] = "Event successfully deleted"
  end

  private

  def is_admin?
    unless current_user.id == @even.admin.id
      flash[:danger] = "You need admin rights to access this section"
      redirect_to '/events'
    end
  end


end

class AttendancesController < ApplicationController

  before_action :current_user

  def index
    @events = current_user.events
  end

  def new
    @event = Event.find(params['event_id'])
    if @event.admin == current_user || @event.users.include?(current_user)
      flash[:warning] = "You already joined the event"
      redirect_to event_path(@event.id)
    end
  end

  def create
    @event = Event.find(params['event_id'])
    @amount = @event.price
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount * 100,
      description: 'Rails Stripe customer',
      currency: 'eur',
      })
      @event.users << current_user
      flash[:success] = "Joined!"
      redirect_to event_path(@event.id)
    rescue Stripe::CardError => e
      flash[:danger] = e.message
      redirect_to new_event_attendance_path(@event.id)
  end

end

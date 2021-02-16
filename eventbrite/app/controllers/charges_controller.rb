class ChargesController < ApplicationController

  def new
    @event = Event.find(params['format'])
  end

  def create
  end

end

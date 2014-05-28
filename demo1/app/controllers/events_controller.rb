class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
=begin
    @event = Event.new  #(params[:event])
    @event.name = params[:event][:name]
    @event.description = params[:event][:description]
=end
    @event = Event.new(params[:event])

    
    @event.save

    redirect_to :action => :index
  end

end

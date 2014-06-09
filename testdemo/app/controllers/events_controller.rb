class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    #TBD.
    @event = Event.new(param[:event])
    @event.save
    #render :@event.name

    redirect_to events_url
    #redirect_to  :action => :index
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    @event.save
    
    redirect_to event_url(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to :action => :index
  end


end

class EventsController < ApplicationController
  before_filter :find_event :only => [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  # creat steps: new -> create
  def new
    @event = Event.new
  end

  def create
=begin
    # if model Event dose not support mass assignment.(attr_accessible)
    #
    @event = Event.new  #(params[:event])
    @event.name = params[:event][:name]
    @event.description = params[:event][:description]
=end
    # if model Event does support mass assignment.(attr_accessible)
    @event = Event.new(params[:event])

    if @event.save
      redirect_to :action => :index
    else
      #redirect_to :action => :new  # redirect to new action
      render :action => :new   # send back new.html.erb.
    end
  end

  def show
   # @event = Event.find(params[:id]) # replaces by before_filter
    @page_title = @event.name
  end

  # edit steps: edit -> update
  def edit
    # @event = Event.find(params[:id]) # replaces by before_filter
  end

  def update
    # @event = Event.find(params[:id]) # replaces by before_filter
    
    if @event.update_attributes(params[:event])
      redirect_to :action => :show, :id => @event
    else
      render :action => :edit
    end
  end

  def destroy
    # @event = Event.find(params[:id]) # replaces by before_filter
    @event.destroy

    redirect_to :action => :index
  end

  protected
  def find_event
    @event = Event.find(params[:id])
  end

end

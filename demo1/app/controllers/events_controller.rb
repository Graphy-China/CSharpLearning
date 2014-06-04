class EventsController < ApplicationController
  before_filter :find_event :only => [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    
    # respond_to

    respond_to do |format|
      format.html  #index.html.erb
      format.xml {render :xml => @events.to_xml }
      format.json {render :json => @events.to_json }
      format.atom {@feed_title = "My Event List" } # index.atom.builder
    end

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
      flash[:noticec]="event was successfully created"
      #redirect_to :action => :index
      redirect_to events_url
    else
      #redirect_to :action => :new  # redirect to new action
      render :action => :new   # send back new.html.erb.
    end
  end

  def show
   # @event = Event.find(params[:id]) # replaces by before_filter
    page_title = @event.name

    respond_to do |format|
      format.html {@page_title = @event.name} # show.html.erb
      format.json {render :json => {id:@event.id, name:@event.name}.to_json }
      format.xml  #show.xml.builder
    end

  end

  # edit steps: edit -> update
  def edit
    # @event = Event.find(params[:id]) # replaces by before_filter
  end

  def update
    # @event = Event.find(params[:id]) # replaces by before_filter
    
    if @event.update_attributes(params[:event])
      flash[:notice] = 'event was successfully updated'      
      #redirect_to :action => :show, :id => @event
      redirect_to event_url(@event)
    else
      render :action => :edit
    end
  end

  def destroy
    # @event = Event.find(params[:id]) # replaces by before_filter
    @event.destroy
    flash[:alert] = "event was siccessfully destroyed"
    #redirect_to :action => :index
    redirect_to events_url
  end

  protected
  def find_event
    @event = Event.find(params[:id])
  end

end

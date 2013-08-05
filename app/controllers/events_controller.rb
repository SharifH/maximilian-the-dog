class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash.now[:success] = "Program event successfully created."
      render :show
    else
      flash.now[:error] = "Error, please try creating the program event again."
      render :new
    end    
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
    render :show    
  end

  def destroy
    event = Event.find(params[:id])
    event.delete
    redirect_to events_path    
  end
end

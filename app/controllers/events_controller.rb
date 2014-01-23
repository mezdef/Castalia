class EventsController < ApplicationController

  load_and_authorize_resource

  def index
    @events = Event.all
  end

  def new
  end

  def create
    event = Event.new(event_params)
    users = User.find(params[:user][:member_id])
    event.owner = current_user
    event.users << users && event.users << current_user
    if event.save
      redirect_to event_path, notice: "Successfully created #{event.name}"
    else
      redirect_to event_path warning: "Failed to create event."
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @eventname = @event.name
    @event.destroy
    if @event.destroy
      redirect_to event_path, notice: "Successfully deleted #{@eventname}."
    else
      redirect_to event_path warning: "Failed to delete event."
    end

  end

  private
  def event_params
    params.require(:event).permit(:name, :type, :start, :finish)
  end

end

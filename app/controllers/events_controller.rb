class EventsController < ApplicationController

  # load_and_authorize_resource

  def index
    @events = Event.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = Event.group(:start_date)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if params[:user]
      @users = User.find(params[:user][:member_id])
      @event.users << @users
    end
    @event.users << current_user
    @event.owner = current_user

    if @event.save
      redirect_to event_path, notice: "Successfully created #{@event.name}"
    else
      render 'new'
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
    params.require(:event).permit(:name, :type, :start_date, :finish_date, :user)
  end

end

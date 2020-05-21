class EventsController < ApplicationController
  before_action :current_user

  def index
    @events = Event.all.order('created_at DESC')
    @upcoming_events = Event.upcoming_events
    @prev_events = Event.prev_events
  end

  def new
    @event = User.find(@current_user_id).events.build
  end

  def create
    @event = User.find(@current_user_id).events.build(event_params)

    if @event.save
      redirect_to event_path(@event.id)
    else
      rendes :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.creator
  end

  private

  def current_user
    @current_user_id = session[:current_user_id]
  end

  def event_params
    params.require(:event).permit(:description, :date, :location)
  end
end

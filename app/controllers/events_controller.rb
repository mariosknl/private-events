class EventsController < ApplicationController
  before_action :current_user

  def index; end

  def new
    @event = User.find(@current_user_id).events.build
  end

  def create
    @event = User.find(@current_user_id).events.build(event_params)

    if @event.save
      redirect_to events_show_path(@event.id)
    else
      rendes :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def current_user
    @current_user_id = session[:current_user_id]
  end

  def event_params
    params.require(:event).permit(:description, :date, :location)
  end
end

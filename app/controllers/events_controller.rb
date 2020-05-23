class EventsController < ApplicationController
  after_action :invite_creator, only: [:create]
  def index
    @events = Event.all.order('created_at DESC')
    @upcoming_events = Event.upcoming_events
    @prev_events = Event.prev_events

    redirect_to new_session_path if @current_user.nil?
  end

  def new
    @event = User.find(@current_user_id).events.build
  end

  def create
    @event = User.find(@current_user_id).events.build(event_params)

    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.creator

    if @event.date < Time.now
      render :show_past
    else
      render :show
    end
  end

  def invite_creator
    Invitation.create(
      attendee_id: @current_user.id,
      attended_event_id: @event.id
    )
  end

  private

  def event_params
    params.require(:event).permit(:description, :date, :location, :image)
  end
end

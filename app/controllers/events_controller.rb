class EventsController < ApplicationController
  before_action :restrict_new_event
  after_action :invite_creator, only: [:create]
  def index
    @events = Event.all.order('created_at DESC')
    @upcoming_events = Event.upcoming_events
    @prev_events = Event.prev_events

    redirect_to new_session_path unless signed_in?
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to user_path(current_user)
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.creator

    if @event.date < Time.now
      render :show_past
    elsif current_user.can_invite_others?(@event.id)
      render :show
    else
      render :show_not_invited
    end
  end

  def invite_creator
    Invitation.create(
      attendee_id: current_user.id,
      attended_event_id: @event.id
    )
  end

  private

  def restrict_new_event
    redirect_to new_session_path unless signed_in?
  end

  def event_params
    params.require(:event).permit(:description, :date, :location, :time)
  end
end

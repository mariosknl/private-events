class InvitationsController < ApplicationController
  def new
    @invitation = Invitation
  end

  def create
    @invitation = Invitation(attendee_id, attended_event_id).build
  end
end

@event = User.find(@current_user_id).events.build(event_params)

if @event.save
  redirect_to event_path(@event.id)
else
  rendes :new
end

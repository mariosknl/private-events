class InvitationsController < ApplicationController
  def new
    @invitation = Invitation
  end

  def create
    @event_id = params[:information][:event_id]
    @user = User.find(params[:information][:unattendee_id])

    invitation = @user.invitations.build(attended_event_id: @event_id)

    redirect_to event_path(@event_id) if invitation.save
  end
end

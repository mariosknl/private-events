require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Kubilay') }
  let(:event) { Event.new(description: 'Test event', creator_id: 1, date: '2020-02-10') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  describe 'associations' do
    it 'has many events' do
      expect(user).to respond_to(:events)
    end
  end
end

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.new(name: 'Kubilay') }
  let(:event) { Event.new(description: 'Test event', creator_id: 1, date: '2020-02-10') }
  let(:event2) { Event.new(description: 'Test event2', creator_id: 1) }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }
  let(:valid_attributes) do
    { description: 'Test Event', date: '2020-02-10' }
  end
  let(:invalid_attributes) do
    { description: 'Test Event', date: nil }
  end

  describe 'validations' do
    it 'must have a date' do
      expect(event).to be_valid
    end

    it 'is not valid without a date' do
      expect(event2).not_to be_valid
    end

    describe 'associations' do
      it 'is associated to a user' do
        expect(event).to respond_to(:creator)
      end

      it 'has many invitations' do
        expect(event).to respond_to(:invitations)
      end

      it 'has many attendes' do
        expect(event).to respond_to(:attendees)
      end
    end
  end
end

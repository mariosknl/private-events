require 'rails_helper'

RSpec.describe Event, type: :model do
  User.create(name: 'Kubilay')
  let(:event) { Event.new(description: 'Test event', creator_id: 1, date: '2020-02-10', location: 'Patras') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  describe 'validations' do
    it 'must have a date' do
      expect(event).to be_valid
    end

    it 'is not valid without a date' do
      event.date = nil
      expect(event).not_to be_valid
    end

    it 'must have a location' do
      expect(event).to be_valid
    end

    it 'is not valid without a location' do
      event.location = nil
      expect(event).not_to be_valid
    end

    it 'must have a description' do
      expect(event).to be_valid
    end

    it 'is not valid without a description' do
      event.description = nil
      expect(event).not_to be_valid
    end
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

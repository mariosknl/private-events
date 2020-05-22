require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Kubilay') }
  let(:event) { Event.new(description: 'Test event', creator_id: 1, date: '2020-02-10') }
  let(:invitation) { Invitation.new(attendee_id: 1, attended_event_id: 1) }

  describe 'associations' do
    it 'has many events' do
      expect(user).to respond_to(:events)
    end

    it 'has many invitations' do
      expect(user).to respond_to(:invitations)
    end

    it 'has many attended_events' do
      expect(user).to respond_to(:attended_events)
    end
  end

  describe 'validations' do
    it 'must have a name' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end
  end
end

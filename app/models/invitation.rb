class Invitation < ApplicationRecord
  belongs_to :user, foreign_key: 'attendee_id'
  belongs_to :event, foreign_key: 'attended_event_id'
end

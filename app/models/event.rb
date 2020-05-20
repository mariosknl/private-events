class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  has_many :attendees, class_name: 'User', through: :invitations,
                       foreign_key: 'attended_event_id', source: :attendee
  has_many :invitations, foreign_key: 'attended_event_id'
end

class Event < ApplicationRecord
  has_many :invitations, foreign_key: 'attended_event_id'
  has_many :attendees, class_name: 'User', through: :invitations, foreign_key: 'attended_event_id'
  belongs_to :user, foreign_key: 'creator_id'
end

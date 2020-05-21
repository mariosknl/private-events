class Event < ApplicationRecord
  has_many :invitations, foreign_key: 'attended_event_id'
  has_many :attendees, through: :invitations
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  scope :prev_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }

  def unattendees
    User.all - attendees
  end
end

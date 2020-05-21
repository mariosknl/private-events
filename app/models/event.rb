class Event < ApplicationRecord
  has_many :invitations, foreign_key: 'attended_event_id'
  has_many :attendees, through: :invitations
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  def self.past_events
    all.where('date < ?', Time.now)
  end

  def self.future_events
    all.where('date > ?', Time.now)
  end
end

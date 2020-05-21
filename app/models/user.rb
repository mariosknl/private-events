class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations

  def upcoming_events
    events.where('date > ?', Time.now)
  end

  def prev_events
    events.where('date < ?', Time.now)
  end
end

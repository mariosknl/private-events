class User < ApplicationRecord
  validates :name, presence: true
  has_many :events, foreign_key: 'creator_id'
  has_many :invitations, foreign_key: :attendee_id
  has_many :attended_events, through: :invitations

  def invited?(event_id)
    attended_events.exists?(event_id)
  end
end

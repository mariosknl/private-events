class Event < ApplicationRecord
  validates :date, :description, :location, presence: true
  has_many :invitations, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :invitations
  has_one_attached :image
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  scope :prev_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }

  def unattendees
    User.all - attendees
  end
end

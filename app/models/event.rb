class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
end

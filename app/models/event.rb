class Event < ActiveRecord::Base
  has_many :presences
  validates :title, presence: true, length: { minimum: 3 }
  validates :dayofweek, presence: true
  validates :time, presence: true
end

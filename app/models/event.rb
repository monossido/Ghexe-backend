class Event < ActiveRecord::Base
  has_many :presences, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3 }
  validates :dayofweek, presence: true
  validates :time, presence: true
end

class Event < ActiveRecord::Base
  has_many :presence

  validates :title, presence: true,
  length: { minimum: 3 }
  validates :time, presence: true
end

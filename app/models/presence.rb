class Presence < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :user, presence: true
  validates :event, presence: true
  validates :presence, :inclusion => {:in => [true, false]}
end

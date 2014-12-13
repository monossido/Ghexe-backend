class Presence < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :presence, presence: true
end

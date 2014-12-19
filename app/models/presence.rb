class Presence < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
<<<<<<< HEAD
  validates :user, presence: true
  validates :event, presence: true
  validates :presence, :inclusion => {:in => [true, false]}
=======

  validates :presence, presence: true
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
end

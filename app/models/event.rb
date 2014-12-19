class Event < ActiveRecord::Base
<<<<<<< HEAD
  has_many :presences
  validates :title, presence: true, length: { minimum: 3 }
  validates :dayofweek, presence: true
=======
  has_many :presence

  validates :title, presence: true,
  length: { minimum: 3 }
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
  validates :time, presence: true
end

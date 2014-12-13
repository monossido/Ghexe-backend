class User < ActiveRecord::Base
  has_many :presence

  validates :first_name, presence: true,
  length: { minimum: 3 }
  validates :second_name, presence: true,
  length: { minimum: 3 }
  validates :password, presence: true,
  length: { minimum: 5 }
end

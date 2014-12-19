class User < ActiveRecord::Base
<<<<<<< HEAD
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :presences
=======
  has_many :presence

  validates :first_name, presence: true,
  length: { minimum: 3 }
  validates :second_name, presence: true,
  length: { minimum: 3 }
  validates :password, presence: true,
  length: { minimum: 5 }
>>>>>>> 7cc049fc30505611072b7afce4fce3e7abb85011
end

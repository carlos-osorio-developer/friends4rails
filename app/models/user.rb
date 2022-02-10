class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  has_many :friendships
  has_many :friends, through: :friendships

  scope :available, lambda { |user|  
    where.not(id: user.friends.ids)
    .where.not(id: user.id)
  }
end

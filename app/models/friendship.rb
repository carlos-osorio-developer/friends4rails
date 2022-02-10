class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, presence: true
  validates :friend_id, presence: true
  validates :accepted, inclusion: { in: [true, false] }
  
  validates :user_id, uniqueness: { scope: :friend_id, message: "is already a friend" }

  scope :pending, lambda { |user|
    joins(:user)
    .where(:friend_id => user.id, :accepted => false)
  }  
end

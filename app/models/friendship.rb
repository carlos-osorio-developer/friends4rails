class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true
  validates :friend_id, presence: true
  validates :accepted, inclusion: { in: [true, false] }

  validates :user_id, uniqueness: { scope: :friend_id, message: 'is already a friend' }

  scope :pending, lambda { |user|
    joins(:user)
      .where(friend_id: user.id, accepted: false)
  }

  scope :accepted_friends_ids, lambda { |user|
    joins(:user)
      .where(user_id: user.id, accepted: true).pluck(:friend_id)
      .concat(joins(:friend)
    .where(friend_id: user.id, accepted: true).pluck(:user_id))
  }
end

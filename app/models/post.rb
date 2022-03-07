class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true

  scope :timeline, lambda { |user|
    where(user_id: Friendship.accepted_friends_ids(user))
      .or(where(user_id: user.id))
      .order(created_at: :desc)
  }
end

class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  attachment :image
  acts_as_taggable
  acts_as_taggable_on :labels

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end

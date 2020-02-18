class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  attachment :image
  acts_as_taggable
  acts_as_taggable_on :labels
end

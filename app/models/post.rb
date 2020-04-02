class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  attachment :image
  acts_as_taggable

  TAG_TYPES = {
    "cafe" =>   'カフェ',
    "night" => '夜景',
    "sweets" => 'スイーツ',
    "dinner" => 'ディナー',
    "theme" =>  'テーマパーク',
    "shopping" => 'ショッピング'
  }


  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 15 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :tag_list, presence: true

  acts_as_taggable_on \
    :tag_types

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy

  paginates_per 6
end

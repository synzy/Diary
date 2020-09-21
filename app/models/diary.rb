class Diary < ApplicationRecord
  belongs_to :user
  
  has_many :favorites
  has_many :like_users, through: :favorites, source: :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
end

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :photo
  validates :title, :content, :author, :photo, :summary, presence: true
end

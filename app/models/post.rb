class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :image
end

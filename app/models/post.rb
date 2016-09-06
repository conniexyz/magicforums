class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments
  mount_uploader :image, ImageUploader
  belongs_to :user
end



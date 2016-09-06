class User < ApplicationRecord
  has_secure_password 
  has_many :topics   #by Jun
  has_many :posts
  has_many :comments
  mount_uploader :image, ImageUploader
end


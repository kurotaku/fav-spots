class User < ApplicationRecord
  has_secure_password
  
  has_many :spots
  has_many :reviews
  
  mount_uploader :image, ImageUploader
end

class Review < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
end

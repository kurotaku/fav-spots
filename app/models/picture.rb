class Picture < ApplicationRecord
  validates :image, presence: true
  
  belongs_to :review
  mount_uploader :image, ImageUploader
end

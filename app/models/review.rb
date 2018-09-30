class Review < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 255 }
  
  belongs_to :spot
  belongs_to :user
  
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
end

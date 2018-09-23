class User < ApplicationRecord
  has_secure_password
  
  has_many :spots
  has_many :reviews
  
  mount_uploader :image, ImageUploader
  
  after_initialize :set_default_root_admin
  
  def set_default_root_admin
    self.root ||= false
    self.admin ||= false
  end
  
  
end

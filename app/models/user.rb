class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
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

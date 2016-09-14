class User < ApplicationRecord
  
  has_many :microposts
  before_save { self.email = email.downcase }

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  # validates :email, presence: true, uniqueness: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
end

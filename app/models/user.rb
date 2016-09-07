class User < ApplicationRecord
  
  has_many :microposts
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }

end

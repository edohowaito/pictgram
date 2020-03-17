class User < ApplicationRecord
  validates :name, presence: ture
  validates :email, presence: ture
  
  has_secure_password
end

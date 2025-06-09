class User < ApplicationRecord
  validates :username, uniqueness: true, prescence: true
  has_secure_password
end

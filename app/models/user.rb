class User < ApplicationRecord
  validates_uniqueness_of :email
  has_secure_password
end

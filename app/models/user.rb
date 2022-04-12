class User < ApplicationRecord
  has_secure_password
  has_many :todos

  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
end
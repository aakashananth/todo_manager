class User < ApplicationRecord
  validates :first_name, :email, :password_confirmation, presence: true
  validates :password, confirmation: true, length: { in: 6..20 }
  has_secure_password
  has_many :todos
end

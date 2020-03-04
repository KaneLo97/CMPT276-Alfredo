require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  has_many :posts, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
end

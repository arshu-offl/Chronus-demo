class User < ApplicationRecord

  # attr_accessor :password, :password_confirmation
  before_save do 
    email.downcase!
  end

  # validates_confirmation_of  :password
  VALID_EMAIL_REGEX = /\A[\w+-.]+@[a-z\d.-]+([.][a-z\d]+)+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, length: {minimum: 6}
  # validates :password_confirmation, presence: true
  has_secure_password
end

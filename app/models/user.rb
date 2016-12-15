class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first, :last, presence: true
  validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
  
  has_many :buyers, class_name: "Shoe", dependent: :destroy, foreign_key: :buyer_id
  has_many :sellers, class_name: "Shoe", dependent: :destroy, foreign_key: :seller_id
end

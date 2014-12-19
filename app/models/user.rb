class User < ActiveRecord::Base
  has_many :memberships
  has_many :projects, through: :memberships 
  validates :email, presence: true, uniqueness: true, confirmation: true
  has_secure_password
end

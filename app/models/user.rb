class User < ActiveRecord::Base
  #validates :first_name, :last_name,
  validates :email, presence: true, uniqueness: true, confirmation: true
  has_secure_password
end

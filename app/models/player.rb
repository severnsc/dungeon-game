class Player < ApplicationRecord
  has_many :characters
  validates :username, uniqueness: true
  has_secure_password
end

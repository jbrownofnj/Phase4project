class FriendCode < ApplicationRecord
  belongs_to :user
  has_secure_password
  validates :password_digest,presence: true
end

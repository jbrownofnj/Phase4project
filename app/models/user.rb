class User < ApplicationRecord
    has_secure_password
    has_many :tasks
    has_many :preperations, through: :tasks
    has_many :view_permissions
    has_one :friend_code
    has_many :events
    validates :user_name, presence: true, length: {minimum:1,maximum:30}
    validates :color_coefficient, presence: true, length: {maximum:3}
    validates :user_email, presence: true, email: {mode: :strict, require_fqdn: true}
end

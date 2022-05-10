class ViewPermission < ApplicationRecord
  belongs_to :user
  validates :viewable_user, presence: true
end

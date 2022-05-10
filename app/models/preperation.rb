class Preperation < ApplicationRecord
  belongs_to :event
  has_many :tasks
  validates :event_task_preperation_id, presence: true
end

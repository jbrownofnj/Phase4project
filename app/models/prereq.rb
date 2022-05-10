class Prereq < ApplicationRecord
  belongs_to :task
  validates :required_task_id, presence: true
end

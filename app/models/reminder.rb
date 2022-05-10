class Reminder < ApplicationRecord
  belongs_to :task
  validates :reminder_date, presence: true
end

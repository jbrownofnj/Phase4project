class Task < ApplicationRecord
  belongs_to :user
  has_many :prereqs
  has_many :reminders
  validates :task_name, presence: true, length: {minimum:1 , maximum:50}
  validates :task_description,length:{maximum:500}
  validates :task_location,length:{maximum:200}
  validates :task_contact,length:{maximum:100}
  validates :duration, presence: true
 
end

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_description
      t.string :task_location
      t.string :event_contact
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

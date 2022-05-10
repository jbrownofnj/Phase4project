class RenameEventContactToTaskContactInTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :event_contact, :task_contact
  end
end

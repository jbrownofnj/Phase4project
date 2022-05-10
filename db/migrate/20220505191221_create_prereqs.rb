class CreatePrereqs < ActiveRecord::Migration[7.0]
  def change
    create_table :prereqs do |t|
      t.references :task, null: false, foreign_key: true
      t.integer :required_task_id

      t.timestamps
    end
  end
end

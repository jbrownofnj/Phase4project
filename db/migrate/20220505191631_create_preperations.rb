class CreatePreperations < ActiveRecord::Migration[7.0]
  def change
    create_table :preperations do |t|
      t.references :event, null: false, foreign_key: true
      t.integer :event_task_preperation_id

      t.timestamps
    end
  end
end

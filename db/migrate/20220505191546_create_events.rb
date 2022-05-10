class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :event_name
      t.string :event_description
      t.string :event_location
      t.string :event_contact
      t.datetime :event_start
      t.datetime :event_end

      t.timestamps
    end
  end
end

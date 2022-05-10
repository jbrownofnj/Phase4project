class CreateViewPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :view_permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :viewable_user

      t.timestamps
    end
  end
end

class CreateFriendCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_codes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end

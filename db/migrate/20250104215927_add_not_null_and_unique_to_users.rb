class AddNotNullAndUniqueToUsers < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :username, :string, null: false
  end
  add_index :users, :username, unique: true
end

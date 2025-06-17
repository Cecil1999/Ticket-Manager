class AddAdminBoolToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :admin, :boolean, default: 0, null: false
  end
end

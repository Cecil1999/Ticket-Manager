class AddNotNullToTicketsTitle < ActiveRecord::Migration[8.0]
  def change
    change_column :tickets, :title, :string, null: false
  end
end

class AddTitleToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column(:tickets, :title, :string)
  end
end

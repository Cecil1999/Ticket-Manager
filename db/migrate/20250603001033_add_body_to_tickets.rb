class AddBodyToTickets < ActiveRecord::Migration[8.0]
  def change
    add_column(:tickets, :body, :text)
  end
end

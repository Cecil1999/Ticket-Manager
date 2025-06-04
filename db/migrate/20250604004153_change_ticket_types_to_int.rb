class ChangeTicketTypesToInt < ActiveRecord::Migration[8.0]
  def change
    change_column :tickets, :ticket_type, :int
  end
end

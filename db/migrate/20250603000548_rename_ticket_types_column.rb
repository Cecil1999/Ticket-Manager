class RenameTicketTypesColumn < ActiveRecord::Migration[8.0]
  def change
    rename_column :tickets, :type, :ticket_type
  end
end

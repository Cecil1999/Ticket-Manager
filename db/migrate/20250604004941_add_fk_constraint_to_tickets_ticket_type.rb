class AddFkConstraintToTicketsTicketType < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :tickets, :ticket_types
  end
end

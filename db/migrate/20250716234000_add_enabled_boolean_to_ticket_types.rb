class AddEnabledBooleanToTicketTypes < ActiveRecord::Migration[8.0]
  def change
    add_column :ticket_types, :enabled, :boolean, default: true
  end
end

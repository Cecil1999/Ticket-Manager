class CreateTicketTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :ticket_types do |t|
      t.string :type_name
    end
  end
end

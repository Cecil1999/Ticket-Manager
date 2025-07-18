class TicketType < ApplicationRecord
  validates :type_name, presence: true
end

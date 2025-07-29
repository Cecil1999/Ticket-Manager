class TicketType < ApplicationRecord
  has_many :ticket
  validates :type_name, presence: true
end

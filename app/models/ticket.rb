class Ticket < ApplicationRecord
  validates :title, presence: true
  belongs_to :ticket_type, required: true
end

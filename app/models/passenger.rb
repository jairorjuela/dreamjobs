class Passenger < ApplicationRecord
  validates :identification, :mail, :phone, presence: true

  validates :identification, :phone, numericality: { only_integer: true }

  validates_format_of :mail, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end

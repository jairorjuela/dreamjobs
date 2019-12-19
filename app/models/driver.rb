class Driver < ApplicationRecord
  validates :identification, :transit_license, :mail, :phone, :addres, presence: true

  validates :identification, :transit_license, :phone, numericality: { only_integer: true }

  validates_format_of :mail, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end

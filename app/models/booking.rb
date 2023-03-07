# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :email, presence: true

  FILTER_PARAMS = %i[last_name column direction].freeze

  scope :by_last_name, ->(query) { where('bookings.last_name ilike ?', "%#{query}%") }

  def self.filter(filters)
    Booking.by_last_name(filters['last_name']).order("#{filters['column']} #{filters['direction']}")
  end
end

# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :email, presence: true

  FILTER_PARAMS = %i[last_name date column direction].freeze

  scope :by_last_name, ->(query) { where('bookings.last_name ilike ?', "%#{query}%") }
  scope :by_date, ->(query) { where(date: query) if query.present? }

  def self.filter(filters)
    Booking.by_last_name(filters['last_name'])
           .by_date(filters['date'])
           .order("#{filters['column']} #{filters['direction']}")
  end
end

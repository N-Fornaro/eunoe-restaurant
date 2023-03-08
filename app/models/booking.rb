# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :email, presence: true

  FILTER_PARAMS = %i[last_name date column direction].freeze

  scope :by_last_name, ->(last_name) { where('bookings.last_name ilike ?', "%#{last_name}%") if last_name.present? }
  scope :by_date, ->(date) { where(date:) if date.present? }

  def self.filter(filters)
    Booking.by_last_name(filters['last_name'])
           .by_date(filters['date'])
           .order("#{filters['column']} #{filters['direction']}")
  end
end

# frozen_string_literal: true

class Booking < ApplicationRecord

  validates :email, presence: true
  validates :last_name, presence: true
  validates :date, presence: true
  validates :starts_at, presence: true
  validates :people, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 20 }

  FILTER_PARAMS = %i[last_name status date locale archive column direction].freeze

  scope :by_last_name, ->(last_name) { where('bookings.last_name ilike ?', "%#{last_name}%") if last_name.present? }
  scope :by_status, ->(status) { where(status:) if status.present? }
  scope :by_date, ->(date) { (date.length > 10 ? where(date: date.split(' ').first..date.split(' ').last) : where(date:)) if date.present? }
  scope :by_archive, ->(archive) { where('bookings.date >= ?', Date.today) unless archive == '1' }

  def self.filter(filters)
    Booking.by_last_name(filters['last_name'])
           .by_status(filters['status'])
           .by_date(filters['date'])
           .by_archive(filters['archive'])
           .order("#{filters['column']} #{filters['direction']}")
  end
end

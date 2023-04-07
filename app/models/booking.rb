# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email incorrect' }
  validates :last_name, presence: true
  validates :date, presence: true
  validates :phone, presence: true, format: { with: /\A\+?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}\z/, message: 'Numéro de téléphone incorrect' }
  validates :starts_at, presence: true
  validates :people, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 20 }

  HOURS = %w[12:00 12:15 12:30 13:00 13:30 13:45 14:00 14:15 19:00 19:15 19:30 19:45 20:00 20:15 20:30 20:45 21:00 21:15 21:30 21:45 22:00].freeze

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

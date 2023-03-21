class Privatisation < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email incorrect' }
  validates :last_name, presence: true
  validates :date, presence: true
  validates :phone, presence: true
  validates :people, presence: true, numericality: { only_integer: true, greater_than: 24, less_than: 100 }
end

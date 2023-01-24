class Booking < ApplicationRecord
  validates :email, presence: true
end

# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :email, presence: true
end

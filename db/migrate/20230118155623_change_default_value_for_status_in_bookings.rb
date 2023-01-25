# frozen_string_literal: true

class ChangeDefaultValueForStatusInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, 'pending'
  end
end

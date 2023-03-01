# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home restaurant privatisation]

  def home; end

  def restaurant; end

  def admin
    @bookings = Booking.all
  end

  def privatisation; end
end

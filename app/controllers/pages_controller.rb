# frozen_string_literal: true

class PagesController < ApplicationController
  # Line below to uncomment when ready for opening (to remove the temporary homepage / opening soon page)
  skip_before_action :authenticate_user!, only: %i[home restaurant menu privatisation]
  # skip_before_action :authenticate_user!, only: %i[soon]
  layout 'private', only: %i[soon]

  def home; end

  def restaurant; end

  def admin
    @bookings = Booking.all
  end

  def soon
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview
  def booking_saved
    @booking = Booking.first
    BookingMailer.booking_saved(@booking)
  end

  def booking_confirmed
    @booking = Booking.first
    BookingMailer.booking_confirmed(@booking)
  end
end

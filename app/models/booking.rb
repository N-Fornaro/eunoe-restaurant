class Booking < ApplicationRecord
  validates :email, presence: true

  after_create :email_saved
  around_update :email_modified
  after_destroy :email_cancelled

  private

  def email_saved
    BookingMailer.with(booking: self).booking_saved
    # ADD AN ADMIN MAILING HERE TO NOTIFY HIM
  end

  def email_confirmed
    BookingMailer.with(booking: self).booking_confirmed
  end

  def email_modified
    if self.status_changed? && self.status == "confirmed"
      BookingMailer.with(booking: self).booking_confirmed
    elsif self.status_changed? && self.status == "cancelled"
      BookingMailer.with(booking: self).booking_cancelled
    else
      BookingMailer.with(booking: self).booking_modified
    end
  end

  def email_declined
    BookingMailer.with(booking: self).booking_declined
  end
end

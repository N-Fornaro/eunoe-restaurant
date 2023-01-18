class Booking < ApplicationRecord
  validates :email, presence: true

  after_create :email_saved
  around_update :email_updated
  after_destroy :email_cancelled

  private

  def email_saved
    BookingMailer.with(booking: self).booking_saved
    # ADD AN ADMIN MAILING HERE TO NOTIFY HIM
  end

  def email_confirmed
    BookingMailer.with(booking: self).booking_confirmed.deliver!
  end

  def email_updated
    if self.status_changed? && self.status == "confirmed"
      BookingMailer.with(booking: self).booking_confirmed.deliver!
    elsif self.status_changed? && self.status == "declined"
      BookingMailer.with(booking: self).booking_declined.deliver!
    else
      BookingMailer.with(booking: self).booking_modified.deliver!
    end
  end

  def email_cancelled
    BookingMailer.with(booking: self).booking_cancelled.deliver!
  end
end

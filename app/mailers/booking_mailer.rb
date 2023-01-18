class BookingMailer < ApplicationMailer
  default from: 'no-reply@eunoe.resto'
  def booking_saved
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Eunoé - Votre demande de réservation a bien été prise en compte")
  end

  def booking_confirmed
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Eunoé - Confirmation de votre réservation")
  end

  def booking_cancelled
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Eunoé - Annulation de votre réservation.")
    # OPTIONAL
  end

  def booking_declined
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Eunoé - Votre réservation n'a pas pu être validée")
    # OPTIONAL
  end

  def booking_modified
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Eunoé - Modification de votre réservation")
    # OPTIONAL
  end
end

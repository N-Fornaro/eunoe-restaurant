# Mailer controlling the messages sent following the creation or update of a booking
class BookingMailer < ApplicationMailer
  default from: 'no-reply@eunoe.resto'

  def booking_saved
    @booking = params[:booking]
    mail(to: @booking.email, subject: "Eunoé - Votre demande de réservation a bien été prise en compte")
  end

  def notify_admin
    @booking = params[:booking]

    ### !!! Email address below to update when domain name is bought and ready for production !!! ###
    mail(to: "resa@eunoe.resto", from: "Nouvelle demande - #{@booking.last_name.upcase} - #{@booking.people} p. - #{@booking.starts_at}")
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

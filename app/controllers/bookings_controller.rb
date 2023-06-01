# frozen_string_literal: true

class BookingsController < ApplicationController
  include Filterable
  before_action :set_booking, only: %i[confirmation show edit update destroy]

  # Line below to uncomment when ready for opening (to remove the temporary homepage / opening soon page)
  skip_before_action :authenticate_user!, only: %i[new create]

  def index
    @booking = Booking.all
  end

  def show; end

  def new
    @booking = Booking.new
    @hours = Booking::HOURS
    # @hours = [['19:00', '19:00'],
    #           ['19:15', '19:15'],
    #           ['19:30', '19:30'],
    #           ['19:45', '19:45'],
    #           ['20:00', '20:00'],
    #           ['20:15', '20:15'],
    #           ['20:30', '20:30'],
    #           ['20:45', '20:45'],
    #           ['21:00', '21:00'],
    #           ['21:15', '21:15'],
    #           ['21:30', '21:30']]
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      email_saved && notify_admin
      # email_saved
      # redirect_to booking_path(@booking), status: :see_other
      redirect_to home_path, status: :see_other
      flash[:notice] = 'Réservation enregistrée avec succès / Booking successfully saved'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation
    @booking.update!(status: 'confirmed')
    redirect_to bookings_path, status: :see_other
  end

  def edit; end

  def update
    status_changed = set_status_change
    if @booking.update!(booking_params)
      status_changed ? email_status_change : email_modified
      redirect_to booking_path(@booking)
      # redirect_back(fallback_location: home_path)
      flash[:notice] = 'Réservation modifiée avec succès / Booking successfully modified'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def list
    bookings = filter!(Booking)
    render(partial: 'bookings-table', locals: { bookings: })
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date,
                                    :starts_at,
                                    :people,
                                    :gender,
                                    :first_name,
                                    :last_name,
                                    :phone,
                                    :email,
                                    :comment,
                                    :status)
  end

  def email_saved
    BookingMailer.with(booking: @booking).booking_saved.deliver!
  end

  def notify_admin
    BookingMailer.with(booking: @booking).notify_admin.deliver!
  end

  def set_status_change
    @booking.status != booking_params[:status]
  end

  def email_status_change
    case @booking.status
    when 'confirmed'
      BookingMailer.with(booking: @booking).booking_confirmed.deliver!
    when 'declined'
      BookingMailer.with(booking: @booking).booking_declined.deliver!
    when 'cancelled'
      BookingMailer.with(booking: @booking).booking_cancelled.deliver!
    end
  end

  def email_modified
    BookingMailer.with(booking: @booking).booking_modified.deliver!
  end
end

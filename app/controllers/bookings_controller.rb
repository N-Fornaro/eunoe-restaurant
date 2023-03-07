# frozen_string_literal: true

class BookingsController < ApplicationController
  include Filterable
  before_action :set_booking, only: %i[confirmation show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[new show create edit update destroy]

  def index
    @booking = Booking.all
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      email_saved && notify_admin
      redirect_to booking_path(@booking), status: :see_other
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
      # redirect_to booking_path(@booking)
      redirect_back(fallback_location: root_path)
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
    BookingMailer.with(booking: @booking).notify_admin.deliver
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

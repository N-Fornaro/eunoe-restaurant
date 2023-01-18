class BookingsController < ApplicationController
  before_action :set_booking, only: %i[confirmation show edit update destroy]

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
      redirect_to booking_path(@booking), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirmation
    @booking.update!(status: true)
    redirect_to bookings_path, status: :see_other
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
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
end

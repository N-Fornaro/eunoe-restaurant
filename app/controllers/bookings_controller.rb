class BookingsController < ApplicationController

  def index; end
  def show; end
  def new; end
  def create; end
  def confirmation; end
  def edit; end
  def update; end
  def destroy; end

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
                                    :comments,
                                    :status)
  end
end

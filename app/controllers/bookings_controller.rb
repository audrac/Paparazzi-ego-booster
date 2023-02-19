class BookingsController < ApplicationController
  before_action :set_paparazzi, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.paparazzi = @paparazzi

    if @booking.save
      redirect_to paparazzi_path(@paparazzi)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_paparazzi
    @paparazzi = Paparazzi.find(params[:paparazzi_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_location, :meeting_date, :special_request)
  end
end

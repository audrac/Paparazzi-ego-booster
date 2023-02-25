class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy

  def index
    @bookings = policy_scope(Booking).all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @paparazzi = Paparazzi.find(params[:booking][:paparazzi_id])
    @booking.paparazzi = @paparazzi
    if @booking.save
      redirect_to paparazzis_path(@paparazzi)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path(@bookings), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:paparazzi_id, :booking_location, :meeting_date, :special_request)
  end
end

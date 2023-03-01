class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy

  def index
    @bookings = policy_scope(Booking).all
  end

  def new
    @booking = Booking.new
    # @paparazzi = Paparazzi.find(params[:paparazzi_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @paparazzi = Paparazzi.find(params[:booking][:paparazzi_id])
    @booking.paparazzi = @paparazzi
    if @booking.save
      redirect_to bookings_path(@bookings)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    if params[:page] == "dashboard"
      redirect_to dashboard_path, status: :see_other
    else
      redirect_to bookings_path(@bookings), status: :see_other
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:paparazzi_id, :booking_location, :meeting_date, :special_request)
  end
end

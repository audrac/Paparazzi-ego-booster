class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review

    if @review.save
      redirect_to bookings_path, notice: "Thanks for your review!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

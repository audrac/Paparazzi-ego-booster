class PaparazzisController < ApplicationController

  def index
    @paparazzi = Paparazzi.all
  end

  def show
  end

  def new
    @paparazzi = Paparazzi.new
  end

  def create
    @paparazzi = Paparazzi.new(paparazzi_params)
    @paparazzi.user = current_user
    respond_to do |format|
      if @paparazzi.save
        format.html { redirect_to paparazzis_url, notice: "Paparazzi was successfully created." }
        format.json { render :show, status: :created, location: @paparazzi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paparazzi.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def paparazzi_params
    params.require(:paparazzi).permit(:name, :price, :location, :style, :photo)
  end
end

class PaparazzisController < ApplicationController

  def index
    @paparazzi = Paparazzi.all
  end

  def show
  end

  private

  def paparazzi_params
    params.require(:paparazzi).permit(:name, :price, :rating, :location, :style, :photo)
  end
end

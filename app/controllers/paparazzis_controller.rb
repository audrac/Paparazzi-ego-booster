class PaparazzisController < ApplicationController
  before_action :set_paparazzi, only: :show

  def index
    @paparazzi = Paparazzi.all
  end

  def show; end

  private

  def paparazzi_params
    params.require(:paparazzi).permit(:name, :price, :rating, :location, :style, :photo)
  end

  def set_paparazzi
    @paparazzi = Paparazzi.find(params[:id])
  end
end

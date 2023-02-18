class PaparazzisController < ApplicationController
  def index
    paparazzi = Paparazzi.all
  end
end

class PaparazzisController < ApplicationController
  before_action :set_paparazzi, only: %i[show edit update destroy]

  def index
    @paparazzis = policy_scope(Paparazzi).all
  end

  def show
    authorize @paparazzi
    @markers = @paparazzi.geocode.map do |paparazzi|
      {
        lat: paparazzi.latitude,
        lng: paparazzi.longitude
      }
    end
  end

  def new
    @paparazzi = Paparazzi.new
    authorize @paparazzi
  end

  def create
    @paparazzi = Paparazzi.new(paparazzi_params)
    authorize @paparazzi
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

  def edit
    authorize @paparazzi
  end

  def update
    authorize @paparazzi
    @paparazzi.user = current_user
    respond_to do |format|
      if @paparazzi.save
        format.html { redirect_to dashboard_path, notice: "Paparazzi was successfully edited." }
        format.json { render :show, status: :edited, location: @paparazzi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paparazzi.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @paparazzi
    @paparazzi.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: "Paparazzi was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def paparazzi_params
    params.require(:paparazzi).permit(:name, :price, :location, :style, :photo, :description)
  end

  def set_paparazzi
    @paparazzi = Paparazzi.find(params[:id])
  end
end

class FlatsController < ApplicationController


  def index
    @flats = Flat.all
  end

  def show
      @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

   def update
    @flat.update(flat_params)
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flast_path
  end
end


private

  def set_flat

  end

  def flat_params
    params.require(:flat).permit(:name, :address, :drescription, :price_per_night, :number_of_guests, :url)
  end

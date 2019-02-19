class FlatsController < ApplicationController

  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @flats = Flat.where("name LIKE '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end
  end


  def show
    @url = 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/-122.337798,37.810550,9.67,0.00,0.00/1000x600@2x?access_token=pk.eyJ1IjoiZ2VlYmFieWdlZSIsImEiOiJjanJxbnhzM3YwMmtwNDlxZzRsYzE4czEwIn0.c6_wGVPF4ps2oOp6_dqO9Q'
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private
  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :search)
  end

end

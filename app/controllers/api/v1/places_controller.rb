class Api::V1::PlacesController < ApplicationController
  before_action :find_place, only: [ :index, :new, :create, :show, :update, :destroy ]

  def index
    @places = Place.all
 render json: {
    status: true,
    message: "Places fetched successfully",
    data: @places.map do |place|
      {
        id: place.id,
        name: place.name,
        city: place.city,
        country: place.country,
        latitude: place.latitude,
        longitude: place.longitude
      }
    end
  }
  end

  def show
    render json: @place
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(params[:place])
    if @place.save
      flash[:success] = "Place successfully created"
      redirect_to @place
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def update
    if @place.update_attributes(params[:place])
      flash[:success] = "Place was successfully updated"
      redirect_to @place
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @place.destroy
      flash[:success] = "Place was successfully deleted"
      redirect_to @places_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @places_path
    end
  end

  private

    def find_place
      @place = Place.find(params[:id])
    end
end

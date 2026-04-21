class Api::V1::PlacesController < ApplicationController
  before_action :find_place, only: [  :show, :update, :destroy ]

  def index
    # @places = Place.all
    @places= Place.includes(:images)
    # include associated images in the JSON response
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
            longitude: place.longitude,
            images: place.images.map { |img|
                          {
                            id: img.id,
                            url: img.url
                          }
                  }
          }
    end
  }
  end

  def show
    render json: @place.as_json(include: { images: { only: [ :id, :url ] } })
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    if @place.save
     render json: @place, status: :ok
    else
      render json: { "errors": @place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: { "errors": @place.errors.full_messages }, status: :unprocessable_entity
      # render "edit"
    end
  end

  def destroy
    if @place.destroy
      render json: { "status": true, "message": "Place deleted successfully" }, status: :ok
    else
      render json: { "status": false, "message": "Something went wrong" }, status: :unprocessable_entity
    end
  end

  private

    def find_place
      @place = Place.find(params[:id])

    rescue ActiveRecord::RecordNotFound => e
       render json: { status: false, message: e.message }, status: :not_found
    end

    def place_params
      params.require(:place).permit(:name, :description, :city, :state, :country, :latitude, :longitude, :image_url,
        images_attributes: [ :id, :url ])
    end
end

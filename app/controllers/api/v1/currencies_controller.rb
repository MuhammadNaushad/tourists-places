class Api::V1::CurrenciesController < ApplicationController
  before_action :find_currency, only: [ :show, :update, :destroy ]

  def index
    @currencys = Currency.all
    render json: { "status": true, "message": "Currencies Fetched successfully!", "data": @currencys }, status: :ok
  end

  def show
    render json: @currency, status: :ok
  end

  def new
    @currency = Currency.new
  end

  def edit
  end

  def create
    @currency = Currency.new(currency_param)
    if @currency.save
      render json: { status: true, message: "Currency created successfully!", data: @currency }, status: :created
    else
      render json: { status: false, message: "Something went wrong", data: @currency.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @currency.nil?
      render json: "Currency Not Found", status: :not_found
    elsif @currency.update(currency_param)
      render json: @currency, status: :created
    else
      render json: { "errors": @currency.errors.full_messages }, status: :created
    end
  end

  def destroy
    if @currency.destroy
      render json: { status: true, message: "Currency deleted successfully" }, status: :ok
    else
      render json: { status: false, message: "Something went wrong" }, status: :unprocessable_entity
    end
  end

  private

  def find_currency
    @currency = Currency.find_by(id: params[:id])

    # unless @currency
    #   render json: { status: false, message: "Currency Not Found", data: nil }, status: :not_found
    # end
    # if @currency.nil?
    #   render json: { status: false, message: "Currency Not Found", data: nil }, status: :not_found
    # end
    if !@currency
      render json: { status: false, message: "Currency Not Found" }, status: :not_found
    end
  end

  def currency_param
    params.require(:currency).permit(:name, :symbol, :code)
  end
end

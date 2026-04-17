class Api::V1::CurrenciesController < ApplicationController
  before_action :find_currency, except: [ :index, :new, :create ]

  def index
    @currencys = Currency.all
    render json: @currencys
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def edit
  end

  def create
    @currency = Currency.new(params[:currency])
    if @currency.save
      flash[:success] = "Currency successfully created"
      redirect_to @currency
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def update
    if @currency.update_attributes(params[:currency])
      flash[:success] = "Currency was successfully updated"
      redirect_to @currency
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @currency.destroy
      flash[:success] = "Currency was successfully deleted"
      redirect_to @currencys_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @currencys_path
    end
  end

  private

    def find_currency
      @currency = Currency.find(params[:id])
    end
end

class CurrenciesController < ApplicationController
  def index
    if params[:collected]
      @currencies = Currency.includes(:countries).collected
    elsif params[:not_collected]
      @currencies = Currency.includes(:countries).not_collected
    elsif params[:country_not_visited]
      @currencies = Currency.includes(:countries).where(countries: {visited: false}).all
    else
      @currencies = Currency.includes(:countries).all
    end
  end

  def show
    @currency = Currency.find(params[:id])
  end
end
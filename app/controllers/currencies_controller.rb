class CurrenciesController < ApplicationController
  def index
    if params[:collected]
      @currencies = Currency.includes(:countries).collected
    elsif params[:not_collected]
      @currencies = Currency.includes(:countries).not_collected
    else
      @currencies = Currency.includes(:countries).all
    end
  end

  def show
    @currency = Currency.find(params[:id])
  end

  def collect;  end
end
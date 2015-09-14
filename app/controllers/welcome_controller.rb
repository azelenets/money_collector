class WelcomeController < ApplicationController
  def index
    @trips = Trip.all
    @countries = Country.all
    @currencies = Currency.all
  end
end
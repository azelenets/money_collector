class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    flash[:notice] = 'Trip successfully created.'
    redirect_to trips_path
  end

  def destroy
    flash[:alert] = 'Trip successfully deleted.'
    redirect_to trips_path
  end

  def finish
    trip = Trip.find(params[:id])
    trip.finish!

    redirect_to trips_path
  end
end

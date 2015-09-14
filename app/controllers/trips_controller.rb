class TripsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @trips = Trip.includes(:countries).all
  end

  def show
    @trip = Trip.includes(:countries).find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.includes(:countries).find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])

    if trip.update(trip_params)
      redirect_to trips_path, notice: 'Trip successfully updated.'
    else
      redirect_to :back, alert: trip.errors.full_messages.join('<br>').html_safe
    end
  end

  def create
    trip = Trip.new(trip_params)
    if trip.save
      redirect_to trips_path, notice: 'Trip successfully created.'
    else
      redirect_to :back, alert: trip.errors.full_messages.join('<br>').html_safe
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    if trip.destroy
      redirect_to trips_path, notice: 'Trip successfully deleted.'
    else
      redirect_to :back, alert: trip.errors.full_messages.join('<br>').html_safe
    end
  end

  def finish
    trip = Trip.find(params[:id])
    trip.finish!
    redirect_to trips_path, notice: 'Trip successfully finished.'
  end

  def trip_params
    params.require(:trip).permit(:end_date, :description, country_ids: [], countries: [])
  end
end

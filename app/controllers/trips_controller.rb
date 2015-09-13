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

  def create
    trip = Trip.new(create_params)
    if trip.save
      redirect_to trips_path, notice: 'Trip successfully created.'
    else
      redirect_to :back, alert: 'Errors happened during creating.'
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    if trip.destroy
      redirect_to trips_path, notice: 'Trip successfully deleted.'
    else
      redirect_to :back, alert: 'Errors happened during deleting.'
    end
  end

  def finish
    trip = Trip.find(params[:id])
    trip.finish!
    redirect_to trips_path, notice: 'Trip successfully finished.'
  end

  def create_params
    params.require(:trip).permit(:end_date, :description, country_ids: [])
  end
end

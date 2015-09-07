class CountriesController < ApplicationController
  def index
    if params[:visited]
      @countries = Country.includes(:currencies).visited
    elsif params[:not_visited]
      @countries = Country.includes(:currencies).not_visited
    else
      @countries = Country.includes(:currencies).all
    end
  end

  def show
    @country = Country.find(params[:id])
  end

  def visit
    country = Country.find(params[:id])
    country.visit

    render json: {
             status: 200,
             html: '<span class="label label-success" style="float: right;">Visited</span><div class="clearfix"></div>'
           }
  end
end
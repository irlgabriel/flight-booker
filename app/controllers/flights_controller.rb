class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def search
    @airports = Airport.all
    @flights = Flight.all
  end


  private

  def flights_params
    params.require(:flight)
  end
end

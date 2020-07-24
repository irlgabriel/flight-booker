class FlightsController < ApplicationController

  def index
    @airports = Airport.all

    if params[:to_airport_id] and params[:from_airport_id]
      @available_flights = Flight.where(to_airport_id: params[:to_airport_id], from_airport_id: params[:from_airport_id])
    else
      @available_flights = []
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:to_airport_id, :from_airport_id, :travel_duration, :departure_time)
  end
end

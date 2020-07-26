class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @from = Airport.find(@flight.from_airport_id)
    @to = Airport.find(@flight.to_airport_id)
    @booking = @flight.bookings.new
  end

  def create

  end

  private

  def booking_params
    
  end

end

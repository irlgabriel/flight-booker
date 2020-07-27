class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @from = Airport.find(@flight.from_airport_id)
    @to = Airport.find(@flight.to_airport_id)
    @passengers = params[:passengers]
    @flight.passengers = @passengers
    @booking = @flight.bookings.new
  end

  def create
    @flight = Flight.find(flight_id)
    @booking = @flight.Bookings.create(booking_params)
    if @booking.save 
      redirect_to @booking
    else
      render "new"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:passengers, :flight_id)
  end

end

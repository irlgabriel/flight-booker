class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @from = Airport.find(@flight.from_airport_id).code
    @to = Airport.find(@flight.to_airport_id).code
    @passengers = params[:passengers].to_i
    @booking = @flight.bookings.new
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.create(booking_params)
    @from = Airport.find(@flight.from_airport_id).code
    @to = Airport.find(@flight.to_airport_id).code
    if @booking.save 
      redirect_to bookings_path
    else
      render "new"
    end
  end

  def index
    @bookings = Booking.all

  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
    @to = Airport.find(@flight.to_airport_id)
    @from = Airport.find(@flight.from_airport_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_id: [] )
  end

end

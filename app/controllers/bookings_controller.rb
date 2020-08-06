class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @from = Airport.find(@flight.from_airport_id).code
    @to = Airport.find(@flight.to_airport_id).code
    @no_of_passengers = params[:passengers].to_i
    @booking = @flight.bookings.new
    @passengers = Passenger.new
    #byebug

  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.create(booking_params)
    @from = Airport.find(@flight.from_airport_id).code
    @to = Airport.find(@flight.to_airport_id).code
    @passengers = Passenger.new
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
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :first_name, :last_name, :email ])
  end

end

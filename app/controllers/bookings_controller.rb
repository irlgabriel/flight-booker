class BookingsController < ApplicationController

  

  def new
    @flight = Flight.find(params[:flight_id])
    @from = Airport.find(@flight.from_airport_id).code
    @to = Airport.find(@flight.to_airport_id).code
    @no_of_passengers = params[:passengers].to_i
    
    @booking = @flight.bookings.new
    @booking.user_id = current_user.id
    @passengers = Passenger.new

  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = @flight.bookings.create(booking_params)
    @from = Airport.find(@flight.from_airport_id).code
    @to = Airport.find(@flight.to_airport_id).code
    @passengers = Passenger.new
    @booking.user_id = current_user.id

    if @booking.save 
      #needed because I cant figure proper associations
      #also put it here because unless it is saved,
      #@booking.id is nil!
      @booking.passengers.each do |passenger| 
        passenger.booking_id = @booking.id
      end

      redirect_to bookings_path
    else
      render "new"
    end
  end

  def index
    @bookings = Booking.all
    render 'index', locals: {bookings: @bookings}
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
    @to = Airport.find(@flight.to_airport_id)
    @from = Airport.find(@flight.from_airport_id)
    @user_booking = User.find(@booking.user_id)
  end

  def user_bookings
    if current_user
      @user_bookings = current_user.bookings
      
    else
      redirect_to new_user_session_path
      flash[:notice] = "You need to be logged in to see your bookings!"
    end
    
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :first_name, :last_name, :email ])
  end

  

end

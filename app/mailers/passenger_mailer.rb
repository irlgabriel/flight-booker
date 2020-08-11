class PassengerMailer < ApplicationMailer

  default from: 'odinAirways@example.com'

  def thank_you_email
    @user = params[:user]
    @booking = params[:booking]
    @passengers = @booking.passengers
    @flight = Flight.find(@booking.flight_id)
    mail(to: @user.email, subject: 'Odin Airways - Your Booking')
  end

end

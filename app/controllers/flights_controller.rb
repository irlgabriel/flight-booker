class FlightsController < ApplicationController

  def index
    @airports = Airport.all
    if params[:to_airport_id] and params[:from_airport_id]
      @date = Time.new(params[:date][:year], params[:date][:month], params[:date][:day], 0,0,0)
      @available_flights = Flight.where(to_airport_id: params[:to_airport_id], from_airport_id: params[:from_airport_id]).to_ary.extract! {|f| f.departure_time.month == @date.month }
      @byebug
    else
      @available_flights = []
    end
    
  end

  private

  def flight_params
    params.require(:flight).permit(:to_airport_id, :from_airport_id, :travel_duration, :departure_time, :passengers, :pick)
  end
end

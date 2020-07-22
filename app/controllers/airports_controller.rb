class AirportsController < ApplicationController

  def index
    @airports = Airport.all
  end

  private

  def airport_params
    params.require(:airport).permit(:code)
  end

end

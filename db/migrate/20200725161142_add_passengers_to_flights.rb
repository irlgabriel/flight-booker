class AddPassengersToFlights < ActiveRecord::Migration[6.0]
  def change
    add_reference :flights, :passenger
  end
end

class AddFlightToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :flight
  end
end

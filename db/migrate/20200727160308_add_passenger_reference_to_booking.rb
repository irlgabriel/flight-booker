class AddPassengerReferenceToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :passenger
  end
end

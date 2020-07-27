class AddPassengerReferenceToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :passengers
  end
end

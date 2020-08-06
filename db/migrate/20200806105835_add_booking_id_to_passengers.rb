class AddBookingIdToPassengers < ActiveRecord::Migration[6.0]
  def change
    add_reference :passengers, :booking
  end
end

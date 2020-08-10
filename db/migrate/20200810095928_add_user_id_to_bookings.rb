class AddUserIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :user
  end
end

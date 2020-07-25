class AddPassengersToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :passengers, :integer
  end
end

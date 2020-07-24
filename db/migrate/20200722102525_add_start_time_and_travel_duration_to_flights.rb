class AddStartTimeAndTravelDurationToFlights < ActiveRecord::Migration[6.0]
  def change
    add_column :flights, :travel_duration, :string
    add_column :flights, :departure_time, :datetime
  end
end

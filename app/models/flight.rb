class Flight < ApplicationRecord
  has_one :arriving_airport, class_name: "Airport"
  has_one :departing_airport, class_name: "Airport"
end

class Airport < ApplicationRecord
  has_one :departing_flight, class_name: 'Flight'
  has_one :arriving_flight, class_name: 'Flight'
end

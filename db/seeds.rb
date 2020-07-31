# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'


Airport.create(code: 'SFO')
Airport.create(code: 'NYC')
Airport.create(code: 'OTP')
Airport.create(code: 'CGN')
Airport.create(code: 'BLQ')
Airport.create(code: 'LAX')
Airport.create(code: 'DXB')



665.times do 
  @a1 = Airport.all[rand(7)]
  @a2 = Airport.all[rand(7)]
  @dt = Time.at(((Time.now + 25.days).to_f - (Time.now).to_f)*rand + (Time.now).to_f)
  @td = "#{rand(10)}:#{rand(60)}"
  Flight.create(from_airport_id: @a1.id,
                to_airport_id: @a2.id,
                travel_duration: @td,
                departure_time: @dt) if @a1 != @a2
end
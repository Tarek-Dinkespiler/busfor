# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destination
[
  { city: "London", country: "United Kingdom" },
  { city: "Paris", country: "France" },
  { city: "Moscow", country: "Russia" },
  { city: "Kiev", country: "Ukraine" }
].each do |destination|
    Destination.find_or_create_by(city: destination[:city], country: destination[:country])
  end

# BusRoute
london_id = Destination.find_by(city: "London").id
paris_id = Destination.find_by(city: "Paris").id
moscow_id = Destination.find_by(city: "Moscow").id
kiev_id = Destination.find_by(city: "Kiev").id

# BusRoute for Paris to London and back
BusRoute.find_or_create_by(from_id: paris_id, to_id: london_id)
BusRoute.find_or_create_by(from_id: london_id, to_id: paris_id)

# BusRoute for Paris to Moscow and back
BusRoute.find_or_create_by(from_id: paris_id, to_id: moscow_id)
BusRoute.find_or_create_by(from_id: moscow_id, to_id: paris_id)

# BusRoute for Paris to Kiev and back
BusRoute.find_or_create_by(from_id: paris_id, to_id: kiev_id)
BusRoute.find_or_create_by(from_id: kiev_id, to_id: paris_id)

# BusRoute for Moscow to Kiev and back
BusRoute.find_or_create_by(from_id: moscow_id, to_id: kiev_id)
BusRoute.find_or_create_by(from_id: kiev_id, to_id: moscow_id)

# BusTimeTable
paris_to_london = BusRoute.find_by(from_id: paris_id, to_id: london_id).id
london_to_paris = BusRoute.find_by(from_id: london_id, to_id: paris_id).id
paris_to_moscow = BusRoute.find_by(from_id: paris_id, to_id: moscow_id).id
moscow_to_paris = BusRoute.find_by(from_id: moscow_id, to_id: paris_id).id
paris_to_kiev = BusRoute.find_by(from_id: paris_id, to_id: kiev_id).id
kiev_to_paris = BusRoute.find_by(from_id: kiev_id, to_id: paris_id).id

for day in 7..13 do
  BusTimeTable.find_or_create_by(
    bus_route_id: paris_to_london,
    departure_time: DateTime.new(2024, 10, day, 0, 30, 0),
    arrival_time: DateTime.new(2024, 10, day, 9, 25, 0),
  )

  BusTimeTable.find_or_create_by(
    bus_route_id: paris_to_london,
    departure_time: DateTime.new(2024, 10, day, 8, 00, 0),
    arrival_time: DateTime.new(2024, 10, day, 16, 25, 0),
  )
end

for day in 7..13 do
  BusTimeTable.find_or_create_by(
    bus_route_id: london_to_paris,
    departure_time: DateTime.new(2024, 10, day, 0, 5, 0),
    arrival_time: DateTime.new(2024, 10, day, 10, 45, 0),
  )

  BusTimeTable.find_or_create_by(
    bus_route_id: london_to_paris,
    departure_time: DateTime.new(2024, 10, day, 7, 30, 0),
    arrival_time: DateTime.new(2024, 10, day, 17, 55, 0),
  )
end

BusTimeTable.find_or_create_by(
  bus_route_id: paris_to_moscow,
  departure_time: DateTime.new(2024, 10, 7, 5, 45, 0),
  arrival_time: DateTime.new(2024, 10, 9, 8, 0, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: paris_to_moscow,
  departure_time: DateTime.new(2024, 10, 9, 5, 45, 0),
  arrival_time: DateTime.new(2024, 10, 11, 8, 0, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: paris_to_moscow,
  departure_time: DateTime.new(2024, 10, 10, 7, 30, 0),
  arrival_time: DateTime.new(2024, 10, 12, 17, 55, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: moscow_to_paris,
  departure_time: DateTime.new(2024, 10, 7, 4, 30, 0),
  arrival_time: DateTime.new(2024, 10, 9, 7, 55, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: moscow_to_paris,
  departure_time: DateTime.new(2024, 10, 8, 4, 30, 0),
  arrival_time: DateTime.new(2024, 10, 10, 7, 55, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: moscow_to_paris,
  departure_time: DateTime.new(2024, 10, 10, 4, 30, 0),
  arrival_time: DateTime.new(2024, 10, 12, 7, 55, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: paris_to_kiev,
  departure_time: DateTime.new(2024, 10, 8, 15, 30, 0),
  arrival_time: DateTime.new(2024, 10, 10, 8, 15, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: paris_to_kiev,
  departure_time: DateTime.new(2024, 10, 9, 15, 30, 0),
  arrival_time: DateTime.new(2024, 10, 11, 8, 15, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: paris_to_kiev,
  departure_time: DateTime.new(2024, 10, 10, 15, 30, 0),
  arrival_time: DateTime.new(2024, 10, 12, 8, 15, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: kiev_to_paris,
  departure_time: DateTime.new(2024, 10, 8, 15, 30, 0),
  arrival_time: DateTime.new(2024, 10, 10, 8, 15, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: kiev_to_paris,
  departure_time: DateTime.new(2024, 10, 9, 15, 30, 0),
  arrival_time: DateTime.new(2024, 10, 11, 8, 15, 0),
)

BusTimeTable.find_or_create_by(
  bus_route_id: kiev_to_paris,
  departure_time: DateTime.new(2024, 10, 10, 15, 30, 0),
  arrival_time: DateTime.new(2024, 10, 12, 8, 15, 0),
)

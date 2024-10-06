class BusTimeTable < ApplicationRecord
  belongs_to :bus_route

  def self.find_travel_options(from_city, to_city, selected_date)
    # selected_date = "2024-10-8T00:00:00.000Z"
    departure = DateTime.parse(selected_date)
    route = BusRoute.find_by_from_to(from_city, to_city)

    route.schedules.where(
      departure_time: departure.beginning_of_day..departure.end_of_day
    )
  end
end

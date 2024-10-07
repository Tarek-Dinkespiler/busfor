class BusTimeTable < ApplicationRecord
  belongs_to :bus_route

  def self.find_travel_options(from_city, to_city, selected_date)
    route = BusRoute.find_by_from_to(from_city, to_city)
    return [] if !route

    departure = DateTime.parse(selected_date)
    route.schedules.where(
      departure_time: departure.beginning_of_day..departure.end_of_day
    )
  end
end

class BusRoute < ApplicationRecord
  belongs_to :from, class_name: "Destination"
  belongs_to :to, class_name: "Destination"
  has_many :schedules, class_name: "BusTimeTable"

  def self.find_by_from_to(from_city, to_city)
    from =  Destination.find_by(city: from_city).try(:id)
    to = Destination.find_by(city: to_city).try(:id)

    BusRoute.find_by(from_id: from, to_id: to)
  end
end

class AddBusRouteReferenceToBusTimeTables < ActiveRecord::Migration[7.2]
  def change
    add_reference :bus_time_tables, :bus_route, null: false, foreign_key: true

    add_index :bus_time_tables, [ :departure_time, :arrival_time, :bus_route_id ], unique: true
  end
end

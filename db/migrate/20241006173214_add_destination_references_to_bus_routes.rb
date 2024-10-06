class AddDestinationReferencesToBusRoutes < ActiveRecord::Migration[7.2]
  def change
    add_reference :bus_routes, :from, null: false, foreign_key: { to_table: 'destinations' }
    add_reference :bus_routes, :to, null: false, foreign_key: { to_table: 'destinations' }
    add_index :bus_routes, [ :from_id, :to_id ], unique: true
  end
end

class CreateBusRoutes < ActiveRecord::Migration[7.2]
  def change
    create_table :bus_routes do |t|
      t.timestamps
    end
  end
end

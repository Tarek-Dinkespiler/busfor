class CreateBusTimeTables < ActiveRecord::Migration[7.2]
  def change
    create_table :bus_time_tables do |t|
      t.timestamps
      t.column :departure_time, :datetime, null: false
      t.column :arrival_time, :datetime, null: false
    end
  end
end

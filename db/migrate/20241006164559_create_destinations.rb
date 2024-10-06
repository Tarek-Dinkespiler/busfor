class CreateDestinations < ActiveRecord::Migration[7.2]
  def change
    create_table :destinations do |t|
      t.timestamps
      t.string :city, null: false
      t.string :country, null: false
    end

    add_index :destinations, [ :city, :country ], unique: true
  end
end

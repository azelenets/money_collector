class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.text :description
      t.datetime :end_date

      t.timestamps null: false
    end

    create_table :countries_trips, id: false do |t|
      t.belongs_to :country
      t.belongs_to :trip
    end
  end
end

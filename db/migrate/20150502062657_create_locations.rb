class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :gym_name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end

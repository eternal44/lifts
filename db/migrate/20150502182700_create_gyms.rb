class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :gym_name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :gyms, :users
  end
end

class ChangeUsersGym < ActiveRecord::Migration
  def change
		change_table :gyms do |t|
			t.remove :user_id
		end

		change_table :users do |t|
			t.integer :gym_id
		end
  end
end

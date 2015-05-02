class AddBodyWeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :body_weight, :integer
  end
end

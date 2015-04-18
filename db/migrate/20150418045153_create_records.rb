class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :lift, index: true
    	t.integer :lift_weight

      t.timestamps null: false
    end
    add_index :records, [:user_id, :created_at]
  end
end

class DropMoreDigestColumns < ActiveRecord::Migration
  def up
  	remove_column :users, :activation_digest
  	remove_column :users, :reset_digest
  end
end
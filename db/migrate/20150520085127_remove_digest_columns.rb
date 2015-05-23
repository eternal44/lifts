class RemoveDigestColumns < ActiveRecord::Migration
  def up
  	remove_column :users, :password_digest
  	remove_column :users, :remember_digest
  end
end

class RemoveAdminBoolean < ActiveRecord::Migration
  def change
  	remove_column :admins, :admin
  end
end
class CreateAdminRoles < ActiveRecord::Migration
  def self.up
    create_table :admin_roles, :id => false do |t|
      t.integer :admin_id, :role_id
    end
  end

  def self.down
    drop_table :admin_roles
  end
end

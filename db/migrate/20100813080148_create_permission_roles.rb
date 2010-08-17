class CreatePermissionRoles < ActiveRecord::Migration
  def self.up
    create_table :permission_roles, :id => false do |t|
      t.integer :permission_id, :role_id
    end
  end

  def self.down
    drop_table :permission_roles
  end
end

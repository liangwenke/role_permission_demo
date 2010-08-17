class CreatePermissionLines < ActiveRecord::Migration
  def self.up
    create_table :permission_lines do |t|
      t.integer :permission_id
      t.string :controller
      t.string :action
      t.string :method
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :permission_lines
  end
end

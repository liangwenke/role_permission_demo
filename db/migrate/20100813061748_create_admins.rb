class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :name
      t.string :password
      t.integer :department_id
      t.text :description
      t.datetime :last_login
      t.integer :login_times

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end

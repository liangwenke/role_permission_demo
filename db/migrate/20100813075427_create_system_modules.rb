class CreateSystemModules < ActiveRecord::Migration
  def self.up
    create_table :system_modules do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :system_modules
  end
end

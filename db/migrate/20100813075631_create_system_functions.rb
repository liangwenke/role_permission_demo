class CreateSystemFunctions < ActiveRecord::Migration
  def self.up
    create_table :system_functions do |t|
      t.integer :system_module_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :system_functions
  end
end

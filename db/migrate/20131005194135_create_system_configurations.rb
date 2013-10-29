class CreateSystemConfigurations < ActiveRecord::Migration
  def change
    create_table :system_configurations do |t|
      t.string :token
      t.integer :workshop_tolerance
      t.integer :exposition_tolerance

      t.timestamps
    end
  end
end

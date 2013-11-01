class CreateStands < ActiveRecord::Migration
  def change
    create_table :stands do |t|
      t.string :name,                        :null => false

      t.timestamps
    end
  end
end

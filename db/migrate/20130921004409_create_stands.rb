class CreateStands < ActiveRecord::Migration
  def change
    create_table :stands do |t|
      t.string :name,                        :null => false
      t.references :exhibitor,               :null => false

      t.timestamps
    end
    add_index :stands, :exhibitor_id
  end
end

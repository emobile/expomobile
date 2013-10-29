class CreateExpositions < ActiveRecord::Migration
  def change
    create_table :expositions do |t|
      t.string :name,                        :null => false
      t.references :stand,                   :null => false
      t.references :exhibitor,               :null => false
      t.datetime :start_date,                :null => false
      t.datetime :end_date,                  :null => false

      t.timestamps
    end
    add_index :expositions, :stand_id
    add_index :expositions, :exhibitor_id
  end
end

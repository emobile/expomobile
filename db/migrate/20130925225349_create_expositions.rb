class CreateExpositions < ActiveRecord::Migration
  def change
    create_table :expositions do |t|
      t.string :name,                        :null => false
      t.string :location ,                   :null => false
      t.string :observations
      t.datetime :start_date,                :null => false
      t.datetime :end_date,                  :null => false

      t.timestamps
    end
  end
end
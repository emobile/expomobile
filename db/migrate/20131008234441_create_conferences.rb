class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name,                                 :null => false
      t.string :conferencist,                         :null => false
      t.datetime :start_date,                         :null => false
      t.datetime :end_date,                           :null => false
      t.string :place,                                :null => false
      t.text :observations

      t.timestamps
    end
  end
end

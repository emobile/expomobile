class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.datetime :event_date,                                :null => false
      t.datetime :event_end_date,                            :null => false
      t.string :event_type,                                  :null => false
      t.string :description,                                 :null => false
      t.string :place,                                       :null => false

      t.timestamps
    end
  end
end
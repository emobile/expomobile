class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.datetime :start_date,          :null => false
      t.datetime :end_date,            :null => false

      t.timestamps
    end
  end
end
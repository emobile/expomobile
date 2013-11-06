class CreateAttendeeExpositions < ActiveRecord::Migration
  def change
    create_table :attendee_expositions do |t|
      t.references :attendee,                   :null => false
      t.references :exhibitor,                 :null => false

      t.timestamps
    end
    add_index :attendee_expositions, :attendee_id
    add_index :attendee_expositions, :exhibitor_id
  end
end

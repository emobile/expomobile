class CreateAttendeeExpositions < ActiveRecord::Migration
  def change
    create_table :attendee_expositions do |t|
      t.references :attendee,                   :null => false
      t.references :exposition,                 :null => false

      t.timestamps
    end
    add_index :attendee_expositions, :attendee_id
    add_index :attendee_expositions, :exposition_id
  end
end

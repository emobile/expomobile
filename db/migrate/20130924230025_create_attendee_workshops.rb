class CreateAttendeeWorkshops < ActiveRecord::Migration
  def change
    create_table :attendee_workshops do |t|
      t.references :attendee,                   :null => false
      t.references :workshop,                   :null => false

      t.timestamps
    end
    add_index :attendee_workshops, :attendee_id
    add_index :attendee_workshops, :workshop_id
  end
end

class CreateNips < ActiveRecord::Migration
  def change
    create_table :nips do |t|
      t.string :nip,                   :null => false
      t.datetime :sent
      t.references :attendee,          :null => false
      t.integer :times_sent

      t.timestamps
    end
    add_foreign_key :nips, :attendees, :name => :nips_attendee_id_fk, :dependent => :delete
  end
end
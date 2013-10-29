class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name,                  :null => false
      t.string :workshop_key,          :null => false
      t.string :teacher_name,          :null => false
      t.references :room,              :null => false

      t.timestamps
    end
    add_foreign_key :workshops, :rooms, :name => :workshops_room_id_fk
  end
end

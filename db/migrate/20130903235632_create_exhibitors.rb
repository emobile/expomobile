class CreateExhibitors < ActiveRecord::Migration
  def change
    create_table :exhibitors do |t|
      t.string :name,          :null => false
      t.string :social_reason, :null => false
      t.string :job,           :null => false

      t.timestamps
    end
  end
end
class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name,                                  :null => false
      t.string :job
      t.string :social_reason,                         :null => false
      t.string :web_page
      t.string :work_street
      t.string :work_street_number
      t.string :work_colony
      t.string :work_zip
      t.string :web_page
      t.string :phone,                                 :null => false
      t.string :email,                                 :null => false
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
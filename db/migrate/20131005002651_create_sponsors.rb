class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name,                                  :null => false
      t.string :job
      t.string :social_reason,                         :null => false
      t.string :work_address
      t.string :web_page
      t.string :phone,                                 :null => false
      t.string :email,                                 :null => false
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,          :null => false
      t.string :last_name,           :null => false
      t.string :phone,              :null => false
      t.string :address,            :null => false
      t.string :city,                :null => false
      t.string :state,               :null => false
      t.integer :zip,                :null => false
      t.string :country,             :null => false
      t.references :role,            :null => false, :default => 2

      t.timestamps
    end
    add_foreign_key :users, :roles, :name => :users_role_id_fk
  end
end
class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :cell_number
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.integer :bond_id

      t.timestamps
    end
  end
end

class AddBondIdAndInterestIdToPeopleLists < ActiveRecord::Migration
  def change
    add_column :people_lists, :bond_id, :integer
    add_column :people_lists, :interest_id, :integer
  end
end

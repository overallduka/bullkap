class RenamePeoplePeopleLists < ActiveRecord::Migration
  def change
  	rename_table :people_lists_persons, :people_people_lists
  end
end

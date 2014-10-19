class RenameInterestsPersons < ActiveRecord::Migration
  def change
  	 rename_table :interests_persons, :interests_people
  end
end

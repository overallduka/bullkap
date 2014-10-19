class CreatePeopleListsPersons < ActiveRecord::Migration
  def change
    create_table :people_lists_persons do |t|
      t.integer :person_id
      t.integer :people_list_id
    end
  end
end

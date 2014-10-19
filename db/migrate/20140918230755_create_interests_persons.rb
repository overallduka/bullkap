class CreateInterestsPersons < ActiveRecord::Migration
  def change
    create_table :interests_persons do |t|
      t.integer :interest_id
      t.integer :person_id
    end
  end
end

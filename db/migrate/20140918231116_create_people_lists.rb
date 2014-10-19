class CreatePeopleLists < ActiveRecord::Migration
  def change
    create_table :people_lists do |t|
      t.boolean :people_by_file
      t.integer :sents_count

      t.timestamps
    end
  end
end

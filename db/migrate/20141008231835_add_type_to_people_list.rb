class AddTypeToPeopleList < ActiveRecord::Migration
  def change
    add_column :people_lists, :type, :string
  end
end

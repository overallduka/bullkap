class CreateBonds < ActiveRecord::Migration
  def change
    create_table :bonds do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateMarketingCampaigns < ActiveRecord::Migration
  def change
    create_table :marketing_campaigns do |t|
      t.string :title
      t.string :sms_content
      t.integer :people_list_id
      t.text :email_content
      t.string :type

      t.timestamps
    end
  end
end

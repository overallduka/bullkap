class AddSentsCountToMarketingCampaign < ActiveRecord::Migration
  def change
    add_column :marketing_campaigns, :sents_count, :integer
  end
end

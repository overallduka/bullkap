require 'spec_helper'

RSpec.describe MarketingCampaign, :type => :model do

  describe '#have_balance?' do

    context 'when campaign type is sms' do
      let(:user) { FactoryGirl.create(:user, credits: 100) }
      let(:campaign) { FactoryGirl.create(:marketing_campaign_sms) }

      context 'when have balance' do
        it 'return true' do
          campaign.user = user
          expect(campaign.have_balance?('sms', 50)).to eq true 
        end
      end

    end
  end

end

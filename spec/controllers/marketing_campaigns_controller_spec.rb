require 'rails_helper'

RSpec.describe MarketingCampaignsController, :type => :controller do
	include Devise::TestHelpers

	let(:user) { FactoryGirl.create(:user) }
	let(:sms_campaign) { FactoryGirl.create(:marketing_campaign_sms) }
	let(:mail_campaign) { FactoryGirl.create(:marketing_campaign_email) }
    let!(:people_list_params) { [ people: [ FactoryGirl.create(:person).id ]] }


	describe "GET index" do
		it "must return all MarketingCampaignSms" do
			sign_in user
	    	get :index, {}
	    	expect(assigns(:sms_campaigns)).to eq([sms_campaign])
		end

		it "must return all MarketingCampaignEmail" do
			sign_in user
	    	get :index, {}
	    	expect(assigns(:mail_campaigns)).to eq([mail_campaign])
		end
	end

	describe "GET new_email" do
		it "must initialize a MarketingCampaignEmail" do
			sign_in user
			get :new_email, {}
			expect(assigns(:campaign)).to be_a_new(MarketingCampaign)
		end	
	end

	describe "GET new_sms" do
		it "must initialize a MarketingCampaignEmail" do
			sign_in user
			get :new_sms, {}
			expect(assigns(:campaign)).to be_a_new(MarketingCampaign)

		end
	end

	describe "POST create" do
=begin   
		before do
			sign_in user
		end

        it "assert all marketing campaigns count is 2" do
            post :create, { :marketing_campaign => { title: "alguma coisa",email_content: "algo 3",type: "MarketingCampaignEmail" }, :people_list => { people: [FactoryGirl.create(:person).id, FactoryGirl.create(:person).id] } }
            expect(MarketingCampaign.all.count).to eq(1)
        end

 
        it "create a sms marketing campaign" do
                expect {
            post :create, { :marketing_campaign => { title: "alguma coisa",sms_content: "algo 3",type: "MarketingCampaignSms",people_list: people: [FactoryGirl.create(:person).id ] }}
                }.to change(MarketingCampaignSms,:count).by(2)
        end
        
        it "create a email marketing campaign" do
                expect {
                    post :create, { :marketing_campaign =>  mail_campaign.attributes }
                }.to change(MarketingCampaignEmail,:count).by(2)
        end
=end

	end


end

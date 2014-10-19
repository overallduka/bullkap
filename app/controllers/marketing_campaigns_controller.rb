class MarketingCampaignsController < ApplicationController

	def dashboard

	end

	def index
		@sms_campaigns = MarketingCampaignSms.all.desc
        @mail_campaigns = MarketingCampaignEmail.all.desc
    end	

	def new_sms
		@campaign = MarketingCampaign.new
        @templates = EmailTemplate.all
	end

	def new_email
		@campaign = MarketingCampaign.new
        @templates = EmailTemplate.all
	end

	def create
        case params[:people_list][:type]
            when 'PeopleList'
                  people_list = resolve_people_list(params[:people_list][:people])
            when 'PeopleListBond' 
                people_list = PeopleListBond.check_bond(params[:people_list][:bond_id])
            when 'PeopleListInterest' 
                people_list = PeopleListInterest.check_interest(params[:people_list][:interest_id])
        end
        
        campaign =  MarketingCampaign.new marketing_campaign_params
        if campaign.valid?
            campaign.people_list_id = people_list.id
            campaign.save
            flash[:notice] = 'Campanha criada e enviada com sucesso'
        else
            flash[:alert] = campaign.errors.full_messages.to_sentence
        end
            campaign.sent    
        redirect_to marketing_campaigns_path
	end

	private

    def resolve_people_list(param)
        people_list_ids = param.to_a.map! { |ele| ele.to_i if ele.present? }
        people = Person.find(people_list_ids)
        people_list = PeopleList.create(sents_count: people_list_ids.count)
        people_list.people << people
        people_list
    end

	def marketing_campaign_params
      params.require(:marketing_campaign).permit(:title, :sms_content, :type, :email_content,:people_list => [:people => []])
    end

end

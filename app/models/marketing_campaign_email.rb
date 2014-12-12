class MarketingCampaignEmail < MarketingCampaign
    
    def sent
        if have_balance?('email',people_list.people.count)
          MarketingMailer.sent_campaign(email_content, people_list.people, nil, title)    
          update_credits('email', people_list.people.count)
          true
        else
          false
        end
    end

end

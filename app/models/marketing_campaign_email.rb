class MarketingCampaignEmail < MarketingCampaign
    
    def sent
        MarketingMailer.sent_campaign(email_content, people_list.people, nil, title)    
    end

end

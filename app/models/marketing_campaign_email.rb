class MarketingCampaignEmail < MarketingCampaign

  def sent
    if have_balance?('email',people_list.people.count)
      MarketingMailer.sent_campaign(email_content, people_list.people, nil, title)    
      reduce_credits('email', people_list.people.count)
      return I18n.t('campaign_sent', success: people_list.people.count, fail: 0)
    else
      false
    end
  end

end

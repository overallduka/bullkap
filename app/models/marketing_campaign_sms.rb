class MarketingCampaignSms < MarketingCampaign
	
  def sent

    return false if !have_balance?('sms', people_list.people.count)

    ac_sid = Settings.twillio.account_sid
    ac_token = Settings.twillio.account_token
    ac_phone = Settings.twillio.phone
    ac_cc = Settings.twillio.country_code

    client = Twilio::REST::Client.new(ac_sid, ac_token)
    sents = 0

    people_list.people.each do |person|   
      begin 
        client.account.messages.create(from: ac_phone,
                                       to: ac_cc+person.cell_number,
                                       body: sms_content)
      rescue => e
        logger.info "Unable to sent: #{e} \nId: #{person.id} \nPerson: #{person.name} \nCell: #{person.cell_number} "
      else
        sents += 1
      end

    end

    reduce_credits('sms',sents)

    return I18n.t('campaign_sent', success: sents, fail: people_list.people.count-sents)
  end


end



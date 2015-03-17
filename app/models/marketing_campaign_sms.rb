class MarketingCampaignSms < MarketingCampaign
	
  def sent

    return [false] if !have_balance?('sms', people_list.people.count)

    ac_sid = RailsConfig::TWILLIO_ACCOUNT_SID
    ac_token = RailsConfig::TWILLIO_ACCOUNT_TOKEN
    ac_phone = RailsConfig::TWILLIO_ACCOUNT_PHONE
    ac_cc = RailsConfig::COUNTRY_CODE

    client = Twilio::REST::Client.new(ac_sid, ac_token)
    sents = 0

    people_list.people.each do |person|   
      begin 
        client.account.messages.create(from: ac_phone,
                                       to: ac_cc+person.cell_number,
                                       body: sms_content)
      rescue => e
        puts "Unable to sent: #{e}"
      else
        sents += 1
      end

    end

    reduce_credits('sms',sents)
    [true, "#{sents} sent, #{people_list.people.count-sents} not sent"]

  end

end



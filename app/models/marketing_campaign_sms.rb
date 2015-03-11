class MarketingCampaignSms < MarketingCampaign
	
  def sent
    if have_balance?('sms',people_list.people.count)

      client = Twilio::REST::Client.new(RailsConfig.TWILLIO_ACCOUNT_SID, RailsConfig.TWILLIO_ACCOUNT_TOKEN)
      sents = 0
      people_list.people.each do |person|   
        begin 
          client.account.messages.create(from: RailsConfig.TWILLIO_ACCOUNT_PHONE,
                                         to: RailsConfig.COUNTRY_CODE+person.cell_number, body: sms_content)
        rescue => e
          puts "Unable to sent: #{e}"
        else
          sents += 1
        end
      end
      reduce_credits('sms',sents)
      true
    else
      false
    end

  end
end



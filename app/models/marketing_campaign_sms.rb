class MarketingCampaignSms < MarketingCampaign
	
    def sent
        account_sid = 'AC9dac1c967947df06a3d6cfc1b5e8eac8' 
        auth_token = '4ae12ae1e27e2f3cb7f2a660a817d31d' 
 
        client = Twilio::REST::Client.new account_sid, auth_token
        
        people_list.people.each do |person|   
            client.account.messages.create(from: '+18554933990', to: '+55'+person.cell_number, body: sms_content)
        end

    end

end
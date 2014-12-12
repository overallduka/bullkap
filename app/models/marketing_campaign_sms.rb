class MarketingCampaignSms < MarketingCampaign
	
    def sent
      if have_balance?('sms',people_list.people.count)
        account_sid = 'AC9dac1c967947df06a3d6cfc1b5e8eac8' 
        auth_token = '4ae12ae1e27e2f3cb7f2a660a817d31d' 
 
        client = Twilio::REST::Client.new account_sid, auth_token
        sents = 0
        people_list.people.each do |person|   
            begin 
                client.account.messages.create(from: '+18554933990', to: '+55'+person.cell_number, body: sms_content)
            rescue => e
                puts "Unable to sent: #{e}"
            else
              sents += 1
            end
        end
        update_credits('sms',sents)
        true
      else
        false
      end
        
    end
end

 

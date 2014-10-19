# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :marketing_campaign_sms do
    title Faker::Name.name
    sms_content Faker::Lorem.sentence(3)
    type 'MarketingCampaignSms'
  end

  factory :marketing_campaign_email do
    title Faker::Name.name
    email_content Faker::Lorem.sentence(3)
    type 'MarketingCampaignEmail'
  end
end

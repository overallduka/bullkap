# BullKap

Ruby on Rails web system to sent bulk messages with SMS and Email.

### System informations
- Ruby on Rails 4.2.0
- Ruby 2.1.5
- PostgreSQL

## Sending emails
**(FREE until reach quota)**

Follow this guide to get your Amazon SMTP credentials via Amazon SES: 
[Guide](http://easymail7.com/tutorials/use-amazon-ses-smtp/)

## Sending SMS
(Paid)
To send SMS you need enter in [Twillio](https://www.twilio.com), buy a phone number and stay with some credits.
After you need get your account_sid and account_token to configure.

## Updating Settings

After you setup Email or SMS put the informations in settings file `app/settings/settings.yml`

Preview of file:

```
price_sms: 0.14
price_email: 0.05
twillio:
  country_code: '+xx'
  phone: '+xxxxxxxxxxx'
  account_cid: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' 
  account_token: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' 
amazon:
  smtp_address: 'email-smtp.us-west-2.amazonaws.com'
  smtp_username: 'xxxxxxxxxxxxxxxxxxxx'
  smtp_password: 'xxxxxxxxxxxxxxxxxxxx'
```

Having credits in services you can start to use the app to sent messages.

# TODO

- Explain about prices
- Lot of other things in code

# Contributing
Please contact me or sent pull requests to the repo, every help is welcome.




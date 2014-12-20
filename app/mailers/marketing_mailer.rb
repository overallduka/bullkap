class MarketingMailer < ActionMailer::Base
  default from: "ramonsl@gmail.com"

    def test(email)
        mail(to: email, subject: "Meu email teste")
    end

    def sent_campaign(content, people, from, subject)
        @content = content
        people.each do |person|
            @name = person.name
            mail(to: person.email, subject: subject).deliver
        end
    end
end

class MarketingCampaign < ActiveRecord::Base
	
    belongs_to :people_list 
    accepts_nested_attributes_for :people_list
    attr_accessor :user
    
    validates :title, presence: true
    
    scope :desc, -> { order('created_at desc') }
    scope :last_month, -> { where('created_at > ?', 1.month.ago) }


    def have_balance? tp, count
      if tp == 'email'
        user.credits > Settings.prices.email*count
      elsif tp == 'sms'
        user.credits > Settings.prices.sms*count
      end        
    end

    def update_credits tp, count
      if tp == 'email'
        credits = user.credits - (count*Settings.prices.email)
      elsif tp == 'sms'
        credits = user.credits - (count * Settings.prices.sms)
      end
      user.update_attribute(:credits,credits)
    end

end

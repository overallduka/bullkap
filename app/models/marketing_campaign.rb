class MarketingCampaign < ActiveRecord::Base
	
    belongs_to :people_list 
    accepts_nested_attributes_for :people_list
    attr_accessor :user
    
    validates :title, presence: true
    
    scope :desc, -> { order('created_at desc') }
    scope :last_month, -> { where('created_at > ?', 1.month.ago) }


    def have_balance? tp, count
      user.credits > (count * price_by_type(tp))
    end

    def reduce_credits tp, count
      credits = user.credits - (count * price_by_type(tp))
      user.update_attribute(:credits,credits)
    end

    def price_by_type(tp)
      Settings.send("price_#{tp}")
    end

end

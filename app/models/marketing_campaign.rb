class MarketingCampaign < ActiveRecord::Base
	
    belongs_to :people_list 
    accepts_nested_attributes_for :people_list
    
    validates :title, presence: true
    
    scope :desc, -> { order('created_at desc') }
    scope :last_month, -> { where('created_at > ?', 1.month.ago) }

end

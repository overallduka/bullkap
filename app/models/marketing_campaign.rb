class MarketingCampaign < ActiveRecord::Base
	
    belongs_to :people_list 
    accepts_nested_attributes_for :people_list
    
    validates :title, presence: true
    
    scope :desc, -> { order('created_at desc') }

end

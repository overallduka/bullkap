class SetupController < ApplicationController
  
  skip_before_filter :authenticate_user!

  def index
  end

  def create
    params.each do |k,v|
      Setting.create(label: k, value: v) if k.match(/config/)
    end
  end

end

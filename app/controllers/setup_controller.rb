class SetupController < ApplicationController
  
  skip_before_filter :authenticate_user!, :setup

  def index

  end

  def create
    params[:setup].each do |k,v|
      Setting.create(label: k, value: v) 
    end
    redirect_to root_path
  end

end

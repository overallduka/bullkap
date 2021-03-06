class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :setup
  before_filter :authenticate_user!, except: :setup 

  protect_from_forgery with: :exception

  protected

  def setup
    if !Setting.exists?(label: 'setup_done')
      redirect_to setup_path 
    end
  end

end

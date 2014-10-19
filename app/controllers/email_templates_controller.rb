class EmailTemplatesController < ApplicationController
    respond_to :js, :html,:json

  def index
  end

  def create
  end

  def new
  end

  def get
        @template = EmailTemplate.find(params[:id])
        respond_with @template
    end

    
    def email_template_params
      params.require(:email_template).permit(:content, :name)
    end

end

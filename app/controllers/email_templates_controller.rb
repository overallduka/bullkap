class EmailTemplatesController < ApplicationController
    respond_to :js, :html,:json

  def index
    @email_templates = EmailTemplate.all
  end

  def create
    @email_template = EmailTemplate.new email_template_params
    @email_template.save
    redirect_to email_templates_path
  end

  def show
    @email_template = EmailTemplate.find(params[:id])    
  end

  def new
    @email_template = EmailTemplate.new
  end

  def get
    @template = EmailTemplate.find(params[:id])
    respond_with @template
  end

  def edit
    @email_template = EmailTemplate.find(params[:id])    
  end

  def update
    @template = EmailTemplate.find(params[:id])
    @template.update_attributes(email_template_params)
    redirect_to email_templates_path
  end

    
  def email_template_params
    params.require(:email_template).permit(:content, :name)
  end

end

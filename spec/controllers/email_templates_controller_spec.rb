require 'rails_helper'

RSpec.describe EmailTemplatesController, :type => :controller do
    include Devise::TestHelpers
 let(:user) { FactoryGirl.create(:user)  }
 let!(:email_template){ FactoryGirl.create(:email_template, id: 2)  }

    
  describe "GET index" do
    it "returns http success" do
    sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
    it "returns http success" do
      sign_in user
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET get" do
    it "assert return a correct template" do
      sign_in user
      get :get, { id: 2 }, format: 'json'
      expect(assigns(:template)).to eq(email_template)
    end
  end

end

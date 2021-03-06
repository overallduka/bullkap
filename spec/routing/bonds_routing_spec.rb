require "rails_helper"

RSpec.describe BondsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bonds").to route_to("bonds#index")
    end

    it "routes to #new" do
      expect(:get => "/bonds/new").to route_to("bonds#new")
    end

    it "routes to #show" do
      expect(:get => "/bonds/1").to route_to("bonds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bonds/1/edit").to route_to("bonds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bonds").to route_to("bonds#create")
    end

    it "routes to #update" do
      expect(:put => "/bonds/1").to route_to("bonds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bonds/1").to route_to("bonds#destroy", :id => "1")
    end

  end
end

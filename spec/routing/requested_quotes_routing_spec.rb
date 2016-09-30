require "rails_helper"

RSpec.describe RequestedQuotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/requested_quotes").to route_to("requested_quotes#index")
    end

    it "routes to #new" do
      expect(:get => "/requested_quotes/new").to route_to("requested_quotes#new")
    end

    it "routes to #show" do
      expect(:get => "/requested_quotes/1").to route_to("requested_quotes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/requested_quotes/1/edit").to route_to("requested_quotes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/requested_quotes").to route_to("requested_quotes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/requested_quotes/1").to route_to("requested_quotes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/requested_quotes/1").to route_to("requested_quotes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/requested_quotes/1").to route_to("requested_quotes#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe CreateTweetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/create_tweets").to route_to("create_tweets#index")
    end

    it "routes to #new" do
      expect(:get => "/create_tweets/new").to route_to("create_tweets#new")
    end

    it "routes to #show" do
      expect(:get => "/create_tweets/1").to route_to("create_tweets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/create_tweets/1/edit").to route_to("create_tweets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/create_tweets").to route_to("create_tweets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/create_tweets/1").to route_to("create_tweets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/create_tweets/1").to route_to("create_tweets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/create_tweets/1").to route_to("create_tweets#destroy", :id => "1")
    end

  end
end

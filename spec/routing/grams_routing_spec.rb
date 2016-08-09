require "rails_helper"

RSpec.describe GramsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grams").to route_to("grams#index")
    end

    it "routes to #new" do
      expect(:get => "/grams/new").to route_to("grams#new")
    end

    it "routes to #show" do
      expect(:get => "/grams/1").to route_to("grams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/grams/1/edit").to route_to("grams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/grams").to route_to("grams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/grams/1").to route_to("grams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/grams/1").to route_to("grams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grams/1").to route_to("grams#destroy", :id => "1")
    end

  end
end

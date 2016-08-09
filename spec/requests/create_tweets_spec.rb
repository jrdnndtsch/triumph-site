require 'rails_helper'

RSpec.describe "CreateTweets", type: :request do
  describe "GET /create_tweets" do
    it "works! (now write some real specs)" do
      get create_tweets_path
      expect(response).to have_http_status(200)
    end
  end
end

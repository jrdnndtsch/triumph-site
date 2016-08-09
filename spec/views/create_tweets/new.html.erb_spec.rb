require 'rails_helper'

RSpec.describe "create_tweets/new", type: :view do
  before(:each) do
    assign(:create_tweet, CreateTweet.new(
      :text => "MyString"
    ))
  end

  it "renders new create_tweet form" do
    render

    assert_select "form[action=?][method=?]", create_tweets_path, "post" do

      assert_select "input#create_tweet_text[name=?]", "create_tweet[text]"
    end
  end
end

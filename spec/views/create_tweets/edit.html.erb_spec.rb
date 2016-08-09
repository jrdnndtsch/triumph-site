require 'rails_helper'

RSpec.describe "create_tweets/edit", type: :view do
  before(:each) do
    @create_tweet = assign(:create_tweet, CreateTweet.create!(
      :text => "MyString"
    ))
  end

  it "renders the edit create_tweet form" do
    render

    assert_select "form[action=?][method=?]", create_tweet_path(@create_tweet), "post" do

      assert_select "input#create_tweet_text[name=?]", "create_tweet[text]"
    end
  end
end

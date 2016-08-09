require 'rails_helper'

RSpec.describe "create_tweets/show", type: :view do
  before(:each) do
    @create_tweet = assign(:create_tweet, CreateTweet.create!(
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
  end
end

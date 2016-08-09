require 'rails_helper'

RSpec.describe "create_tweets/index", type: :view do
  before(:each) do
    assign(:create_tweets, [
      CreateTweet.create!(
        :text => "Text"
      ),
      CreateTweet.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of create_tweets" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end

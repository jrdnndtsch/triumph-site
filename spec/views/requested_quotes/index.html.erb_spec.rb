require 'rails_helper'

RSpec.describe "requested_quotes/index", type: :view do
  before(:each) do
    assign(:requested_quotes, [
      RequestedQuote.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :comments => "MyText"
      ),
      RequestedQuote.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :comments => "MyText"
      )
    ])
  end

  it "renders a list of requested_quotes" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

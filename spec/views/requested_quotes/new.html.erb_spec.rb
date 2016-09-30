require 'rails_helper'

RSpec.describe "requested_quotes/new", type: :view do
  before(:each) do
    assign(:requested_quote, RequestedQuote.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :comments => "MyText"
    ))
  end

  it "renders new requested_quote form" do
    render

    assert_select "form[action=?][method=?]", requested_quotes_path, "post" do

      assert_select "input#requested_quote_first_name[name=?]", "requested_quote[first_name]"

      assert_select "input#requested_quote_last_name[name=?]", "requested_quote[last_name]"

      assert_select "input#requested_quote_email[name=?]", "requested_quote[email]"

      assert_select "input#requested_quote_phone[name=?]", "requested_quote[phone]"

      assert_select "textarea#requested_quote_comments[name=?]", "requested_quote[comments]"
    end
  end
end

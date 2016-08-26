require 'rails_helper'

RSpec.describe "facebooks/edit", type: :view do
  before(:each) do
    @facebook = assign(:facebook, Facebook.create!(
      :message => "MyText",
      :link => "MyString",
      :image_link => "MyString",
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit facebook form" do
    render

    assert_select "form[action=?][method=?]", facebook_path(@facebook), "post" do

      assert_select "textarea#facebook_message[name=?]", "facebook[message]"

      assert_select "input#facebook_link[name=?]", "facebook[link]"

      assert_select "input#facebook_image_link[name=?]", "facebook[image_link]"

      assert_select "input#facebook_title[name=?]", "facebook[title]"

      assert_select "input#facebook_description[name=?]", "facebook[description]"
    end
  end
end

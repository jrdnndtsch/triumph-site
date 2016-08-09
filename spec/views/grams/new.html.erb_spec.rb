require 'rails_helper'

RSpec.describe "grams/new", type: :view do
  before(:each) do
    assign(:gram, Gram.new(
      :text => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders new gram form" do
    render

    assert_select "form[action=?][method=?]", grams_path, "post" do

      assert_select "input#gram_text[name=?]", "gram[text]"

      assert_select "input#gram_image_url[name=?]", "gram[image_url]"
    end
  end
end

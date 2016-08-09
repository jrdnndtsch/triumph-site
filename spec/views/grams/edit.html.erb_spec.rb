require 'rails_helper'

RSpec.describe "grams/edit", type: :view do
  before(:each) do
    @gram = assign(:gram, Gram.create!(
      :text => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders the edit gram form" do
    render

    assert_select "form[action=?][method=?]", gram_path(@gram), "post" do

      assert_select "input#gram_text[name=?]", "gram[text]"

      assert_select "input#gram_image_url[name=?]", "gram[image_url]"
    end
  end
end

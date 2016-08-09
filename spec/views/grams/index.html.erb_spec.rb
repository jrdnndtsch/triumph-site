require 'rails_helper'

RSpec.describe "grams/index", type: :view do
  before(:each) do
    assign(:grams, [
      Gram.create!(
        :text => "Text",
        :image_url => "Image Url"
      ),
      Gram.create!(
        :text => "Text",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of grams" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end

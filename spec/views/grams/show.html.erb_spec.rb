require 'rails_helper'

RSpec.describe "grams/show", type: :view do
  before(:each) do
    @gram = assign(:gram, Gram.create!(
      :text => "Text",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Image Url/)
  end
end

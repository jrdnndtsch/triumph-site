require 'rails_helper'

RSpec.describe "facebooks/show", type: :view do
  before(:each) do
    @facebook = assign(:facebook, Facebook.create!(
      :message => "MyText",
      :link => "Link",
      :image_link => "Image Link",
      :title => "Title",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Image Link/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
  end
end

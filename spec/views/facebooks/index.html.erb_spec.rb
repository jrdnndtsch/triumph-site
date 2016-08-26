require 'rails_helper'

RSpec.describe "facebooks/index", type: :view do
  before(:each) do
    assign(:facebooks, [
      Facebook.create!(
        :message => "MyText",
        :link => "Link",
        :image_link => "Image Link",
        :title => "Title",
        :description => "Description"
      ),
      Facebook.create!(
        :message => "MyText",
        :link => "Link",
        :image_link => "Image Link",
        :title => "Title",
        :description => "Description"
      )
    ])
  end

  it "renders a list of facebooks" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Image Link".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end

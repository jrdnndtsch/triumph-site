require 'rails_helper'

RSpec.describe "Grams", type: :request do
  describe "GET /grams" do
    it "works! (now write some real specs)" do
      get grams_path
      expect(response).to have_http_status(200)
    end
  end
end

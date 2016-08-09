require "rails_helper"

RSpec.describe RequestQuote, type: :mailer do
  describe "new_quote_request" do
    let(:mail) { RequestQuote.new_quote_request }

    it "renders the headers" do
      expect(mail.subject).to eq("New quote request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

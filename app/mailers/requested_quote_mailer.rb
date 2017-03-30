class RequestedQuoteMailer < ApplicationMailer
	require 'mailgun'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_quote.new_quote_request.subject
  #
  def new_quote_request(first, last, email, phone, comment)
    @name = "#{first} #{last}"
    @email = email
    @phone = phone
    @comment = comment
    # mg_client = Mailgun::Client.new ENV['api_key']
    mail to: "hello@upatfive.ca"
  end
end

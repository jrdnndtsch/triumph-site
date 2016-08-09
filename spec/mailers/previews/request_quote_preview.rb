# Preview all emails at http://localhost:3000/rails/mailers/request_quote
class RequestQuotePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_quote/new_quote_request
  def new_quote_request
    RequestQuote.new_quote_request
  end

end

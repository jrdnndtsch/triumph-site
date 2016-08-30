class PagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'rinku'
  def home
  	@tweets = Tweet.last(5)
  	@instagrams = Gram.last(5)
    @facebooks = Facebook.first(2)

  	@socials = []
  	(0..4).each do |i|
  	  @socials << @tweets[i]
  	  @socials << @instagrams[i]
  	end

    if params[:thing]
      @first = params[:first]
      @last = params[:last]
      @email = params[:email]
      @phone = params[:phone]
      @comment = params[:comment]
      RequestQuote.new_quote_request(@first, @last, @email, @phone, @comment).deliver
    end  
  end
end

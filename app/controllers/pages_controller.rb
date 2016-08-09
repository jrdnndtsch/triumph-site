class PagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'rinku'
  def home
  	@tweets = Tweet.last(4)
  	@instagrams = Gram.last(4)

  	@socials = []
  	(0..4).each do |i|
  	  @socials << @tweets[i]
  	  @socials << @instagrams[i]
  	end
  end
end

class PagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'rinku'
  def home
    @requested_quote = RequestedQuote.new
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

  def blog
    @blogs = Blog.paginate(:page => params[:page], :per_page => 9).is_published.order('created_at DESC')
    # @used_link = @blogs.first.external_link ? ERB.new('<%= link_to blog.external_link_url, target: "_blank" do %>') : ERB.new("<%= link_to blog, target:'_blank' do %>")
  end
end

task :update_feed => :environment do
	@triumph_tweets = $client.search("from:Diana_M_Dyer", :result_type => "recent").take(100)
	# @wwf_tweets_with_hashtag = @wwf_tweets.select { |tweet| tweet.text.include?('#CountForNature') }
	@triumph_tweets.last(5).each_with_index do |tweet, index|
		index_plus_one = index + 1
		this_tweet = Tweet.where(id: index_plus_one).first_or_initialize
		this_tweet.update(text: tweet.text)
		this_tweet.save
	end 

	@instas = Instagram.user_recent_media(@wwfcanada, {:count => 15})
	# @instas_with_hashtag = @instas.select { |pic| pic.caption.text.include?('#CountForNature') }
	@instas.last(6).each_with_index do |insta, index|
		index_plus_one = index + 1
		this_insta = Gram.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.update({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.save
	end  
	puts Tweet.first.text
end

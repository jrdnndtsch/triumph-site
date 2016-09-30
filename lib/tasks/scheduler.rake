task :update_feed => :environment do

	@triumph_tweets = $client.user_timeline 
	@triumph_tweets.first(5).each_with_index do |tweet, index|
	  index_plus_one = index + 1
	  this_tweet = Tweet.where(id: index_plus_one).first_or_initialize
	  this_tweet.update(text: tweet.text)
	  this_tweet.save
	end 

	@instas = Instagram.user_recent_media(@triumph_capital, {:count => 15})
	@instas.first(5).each_with_index do |insta, index|
	  index_plus_one = index + 1
	  this_insta = Gram.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
	  this_insta.update({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
	  this_insta.save
	end 

	client = Koala::Facebook::API.new(ENV['fb_access_token'])
    posts = client.get_connection('triumphcapitallimited', 'posts',
                    {
                      fields: ['message', 'id', 'from', 'type',
                                'picture', 'link', 'created_time', 'updated_time'
                        ]})
    id_count = 0
    posts.first(10).each_with_index do |fb, index|
      if fb['link'].present?
        re = Nokogiri::HTML(open(fb['link'], :allow_redirections => :all, 'User-Agent' => 'ruby'))

        re_image = re.css("meta[property='og:image']")
        re_title = re.css("meta[property='og:title']")
        re_desc  = re.css("meta[property='og:description']")

        if re_image.present? && re_title.present?
          re_image_string = re_image.at('meta')['content']
          re_title_string = re_title.at('meta')['content']
          re_desc_string  = re_desc.at('meta')['content']

          id_count += 1

          this_fb = Facebook.where(id: id_count).first_or_initialize({message: fb['message'], link: fb['link'], image_link: re_image_string, title: re_title_string, description: re_desc_string  })
          this_fb.update({message: fb['message'], link: fb['link'], image_link: re_image_string, title: re_title_string, description: re_desc_string  })
          this_fb.save
        end
      end
    end
 
	puts Tweet.first.text
end

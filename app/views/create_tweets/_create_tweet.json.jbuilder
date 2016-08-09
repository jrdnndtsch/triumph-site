json.extract! create_tweet, :id, :text, :created_at, :updated_at
json.url create_tweet_url(create_tweet, format: :json)
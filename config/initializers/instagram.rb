require "instagram"

Instagram.configure do |config|

config.client_id = ENV['insta_client']

config.access_token = ENV['insta_access']

end
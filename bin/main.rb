require 'twitter'
require 'yaml'
require 'dotenv'

Dotenv.load('../.env')


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end





mentions = client.mentions_timeline
#File.write('tweets.yml', YAML.dump(mentions))
mentions.each {|mention| puts mention::text}

#mentions.each {|mention| client.update( '@'+mention::user::screen_name+' Hello human', in_reply_to_status_id: mention::id )}


#
##client.update('@ Hello human', in_reply_to_status_id: 1278077477471096833 )





#File.write('tweets.yml', YAML.dump(mentions))

#tweets = client.user_timeline('rubyinside', count: 20)
#tweets.each { |tweet| puts tweet.full_text }

#
#File.write('tweets.yml', YAML.dump(tweets))
#    client.update("Test")

require 'twitter'
require 'yaml'
require 'dotenv'
Dotenv.load('../.env')

class Twitt

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def tweet(message)
    p @client.update(message)

  end

  def getMentions
    return @client.mentions_timeline
  end

  def reply(message, tweet)
    client.update( '@'+mention::user::screen_name+' '+message, in_reply_to_status_id: mention::id )


  end
end

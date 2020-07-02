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
    @client.update(message)

  end

  def getAllMentions
    return @client.mentions_timeline
  end

  def getNewMentions
    savedMentions=YAML.load(File.read("../lib/tweets.yml"))
    lastMentionDate=savedMentions[0]::created_at
    allMentions = @client.mentions_timeline
    newMentions=allMentions.select { |mention| mention::created_at > lastMentionDate }
    File.write('../lib/tweets.yml', YAML.dump(allMentions))
    return newMentions
  end


  def reply(message, tweet)
    id=tweet::id

    @client.update(message, in_reply_to_status_id: id )
  end

  def getTrendings
    trendings= @client.trends(id=2459115, options = {})
    trendings.each {|topic| puts topic}
    File.write('../lib/trendings.yml', YAML.dump(trendings))
  end
end

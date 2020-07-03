require 'twitter'
require 'yaml'
require 'dotenv'
Dotenv.load('../.env')

class Twitt
  def initialize(enviroment)
    if enviroment == 'production'
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.access_token = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end
    else
      # rubocop:disable Security/YAMLLoad:
      api = YAML.load(File.read('./spec/api.yml'))
      # rubocop:enable Security/YAMLLoad:
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = api[0]
        config.consumer_secret = api[1]
        config.access_token = api[2]
        config.access_token_secret = api[3]
      end
    end
  end

  def tweet(message)
    @client.update(message)
  end

  def all_mentions
    @client.mentions_timeline
  end

  # rubocop:disable Security/YAMLLoad:
  def new_mentions
    if File.file?('../lib/tweets.yml')
      saved_mentions = YAML.load(File.read('../lib/tweets.yml'))
      last_mention_date = saved_mentions[0].created_at
      all_mentions = @client.mentions_timeline
      new = all_mentions.select { |mention| mention.created_at > last_mention_date }
      File.write('../lib/tweets.yml', YAML.dump(all_mentions))
    else
      new = @client.mentions_timeline
      File.write('../lib/tweets.yml', YAML.dump(new))
    end

    new
  end
  # rubocop:enable Security/YAMLLoad:

  def reply(message, tweet)
    id = tweet.id
    @client.update(message, in_reply_to_status_id: id)
  end

  def trendings
    trendings = @client.trends(2_459_115, {})
    trendings.each { |topic| return topic.name }
    # File.write('../lib/trendings.yml', YAML.dump(trendings))
  end
end

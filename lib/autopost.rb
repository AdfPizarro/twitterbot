require_relative '../lib/twitt.rb'
require_relative '../lib/tweet_intent.rb'
require 'yaml'

class Autopost
  def initialize(enviroment)
    @enviroment = enviroment
    @tweet_intent = TweetIntent.new(enviroment)
    @twitt = Twitt.new(enviroment)
  end

  def reply(tweet)
    intent = @tweet_intent.check_intent(tweet.text)

    case intent
    when 'empty'
      reply_empty(tweet)
    when 'greet'
      reply_greet(tweet)
    when 'not clear'
      reply_greet(tweet)
    when 'help'
      reply_commands(tweet)
    when 'meme'
      reply_meme(tweet)
    end
  end

  def reply_empty(tweet)
    message = "Hi @#{tweet.user.screen_name} i see that the message is empty, try by typing help"
    @twitt.reply(message, tweet)
    message
  end

  def reply_greet(tweet)
    message = "Hi @#{tweet.user.screen_name} i wish you are having good day "
    @twitt.reply(message, tweet)
    message
  end

  def reply_commands(tweet)
    message = "Hi @#{tweet.user.screen_name} you i can send you memes, try give me a meme for example"
    @twitt.reply(message, tweet)
    message
  end

  def reply_meme(tweet)
    message = "Hi @#{tweet.user.screen_name} i will take a little while this function is still in development"
    @twitt.reply(message, tweet)
    message
  end

  def post_from_journal
    path = if @enviroment == 'production'
             '../lib/journal.yml'
           else
             './lib/journal.yml'
           end
    # rubocop:disable Security/YAMLLoad:
    messages = YAML.load(File.read(path))
    # rubocop:enable Security/YAMLLoad:
    unless messages.empty?
      message = messages[0]
      messages.shift
      File.write(path, YAML.dump(messages))
      @twitt.tweet(message)
      return message
    end
    'No tweets in the journal'
  end

  def journal_remain
    path = if @enviroment == 'production'
             '../lib/journal.yml'
           else
             './lib/journal.yml'
           end
    # rubocop:disable Security/YAMLLoad:
    messages = YAML.load(File.read(path))
    # rubocop:enable Security/YAMLLoad:
    messages.size
  end

  def post_trending_topic
    topic = @twitt.trendings
    message = "Hello world what do you think about #{topic}"
    @twitt.tweet(message)
    message
  end
end

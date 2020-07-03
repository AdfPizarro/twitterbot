require_relative '../lib/twitt.rb'
require_relative '../lib/tweetIntent.rb'
require 'yaml'


class Autopost
  def initialize(enviroment)
    @enviroment=enviroment
    @tweetIntent=TweetIntent.new(enviroment)
    @twitt=Twitt.new(enviroment)
  end

  def reply(tweet)
    intent=@tweetIntent.checkIntent(tweet::text)

    case intent
      when 'empty'
        replyEmpty(tweet)
      when 'greet'
        replyGreet(tweet)
      when 'not clear'
        replyGreet(tweet)
      when 'help'
        replyCommands(tweet)
      when 'meme'
        replyMeme(tweet)
    end
  end

  def replyEmpty(tweet)
    message= "Hi @#{tweet::user::screen_name} i see that the message is empty, try by typing help"
    @twitt.reply(message, tweet)
    return message
  end

  def replyGreet(tweet)
    message= "Hi @#{tweet::user::screen_name} i wish you are having good day "
    @twitt.reply(message, tweet)
    return message
  end

  def replyCommands(tweet)
    message= "Hi @#{tweet::user::screen_name} you i can send you memes, try give me a meme for example"
    @twitt.reply(message, tweet)
    return message
  end

  def replyMeme(tweet)
    message= "Hi @#{tweet::user::screen_name} i will take a little while this function is still in development"
    @twitt.reply(message, tweet)
    return message
  end

  def postFromJournal
    if @enviroment=="production"
      path="../lib/journal.yml"
    else
      path="./lib/journal.yml"
    end

    messages=YAML.load(File.read(path))
    if messages.size > 0
      message=messages[0]
      messages.shift
      File.write(path, YAML.dump(messages))
      @twitt.tweet(message)
      return message
    end
    return "No tweets in the journal"
  end

  def getJournalRemain
    if @enviroment=="production"
      path="../lib/journal.yml"
    else
      path="./lib/journal.yml"
    end

    messages=YAML.load(File.read(path))
    return messages.size
  end

  def postTrendingTopic
    topic=@twitt.getTrendings
    message = "Hello world what do you think about #{topic}"
    @twitt.tweet(message)
    return message
  end

end

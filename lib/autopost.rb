require_relative '../lib/twitt.rb'
require_relative '../lib/tweetIntent.rb'


class Autopost
  def initialize
    @tweetIntent=TweetIntent.new
    @twitt=Twitt.new
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

  end

  def postTrendingTopic

  end

end

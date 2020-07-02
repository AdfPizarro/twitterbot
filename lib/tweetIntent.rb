class TweetIntent
  def initialize
    @greetList=YAML.load(File.read("../lib/greet.yml"))
    @helpList=YAML.load(File.read("../lib/help.yml"))
    @memeList=YAML.load(File.read("../lib/memes.yml"))
  end

  def checkIntent(message)
    if message=="@adfpizarro"
      return 'empty'
    end

    @greetList.each do |word|
     if /\b#{word.downcase}\b/i.match?(message.downcase)
       return 'greet'
     end
    end

    @helpList.each do |word|
     if /\b#{word.downcase}\b/i.match?(message.downcase)
       return 'help'
     end
    end

    @memeList.each do |word|
     if /\b#{word.downcase}\b/i.match?(message.downcase)
       return 'meme'
     end
    end

    return 'not clear'
  end

end

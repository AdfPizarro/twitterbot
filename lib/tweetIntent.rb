class TweetIntent
  def initialize
    @greetList=YAML.load(File.read("../lib/greet.yml"))
    @helpList=YAML.load(File.read("../lib/help.yml"))
  end

  def checkIntent(message)
    if message=="@adfpizarro"
      return 'empty'
    end

    @greetList.each do |word|
     if /\b#{word}\b/i.match?(message)
       return 'greet'
     end
    end

    @helpList.each do |word|
     if /\b#{word}\b/i.match?(message)
       return 'help'
     end
    end

    return 'not clear'
  end

end

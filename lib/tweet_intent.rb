class TweetIntent
  def initialize(enviroment)
    if enviroment == 'test'
      @greet_list = Psych.load(File.read('./lib/greet.yml'))
      @help_list = Psych.load(File.read('./lib/help.yml'))
      @meme_list = Psych.load(File.read('./lib/memes.yml'))
    else
      @greet_list = Psych.load(File.read('../lib/greet.yml'))
      @help_list = Psych.load(File.read('../lib/help.yml'))
      @meme_list = Psych.load(File.read('../lib/memes.yml'))
    end
  end

  def check_intent(message)
    return 'empty' if message == '@adfpizarro'

    @greet_list.each do |word|
      return 'greet' if /\b#{word.downcase}\b/i.match?(message.downcase)
    end

    @help_list.each do |word|
      return 'help' if /\b#{word.downcase}\b/i.match?(message.downcase)
    end

    @meme_list.each do |word|
      return 'meme' if /\b#{word.downcase}\b/i.match?(message.downcase)
    end

    'not clear'
  end
end

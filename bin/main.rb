require_relative '../lib/autopost.rb'

autopost=Autopost.new
twitt=Twitt.new
intent=TweetIntent.new
timerCount=0



puts "--------Twitter Bot--------"


twitt.getTrendings


while false
  mentions = twitt.getNewMentions
  puts "New mentions: " + mentions.size.to_s

  if mentions.size > 0
    mentions.each do |mention|
      puts "From: #{mention::user::name} @#{mention::user::screen_name}"
      puts mention::text
      puts 'Replying'
      puts autopost.reply(mention)
    end
  end

  if timerCount 120
  end

  sleep 60
  timerCount=+1
end

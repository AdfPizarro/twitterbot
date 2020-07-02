require_relative '../lib/autopost.rb'

autopost=Autopost.new
twitt=Twitt.new
intent=TweetIntent.new
timerCount=0



puts "--------Twitter Bot--------"

puts autopost.getJournalRemain
puts autopost.postFromJournal
puts autopost.getJournalRemain

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

  if timerCount > 120
    puts "Autopublishing trending topic"
    puts autopost.postTrendingTopic
    timerCount=0
  end

  sleep 60
  timerCount=+1
end

require_relative '../lib/autopost.rb'

autopost = Autopost.new
twitt = Twitt.new
trending_count = 0
journal_count = 0

puts '--------Twitter Bot--------'

loop do
  puts "#{autopost.getJournalRemain} remaining tweets in the journal"

  mentions = twitt.getNewMentions
  puts 'New mentions: ' + mentions.size.to_s

  unless mentions.empty?
    mentions.each do |mention|
      puts "From: #{mention.user.name} @#{mention.user.screen_name}"
      puts mention.text
      puts 'Replying'
      puts autopost.reply(mention)
    end
  end

  if journal_count > 240
    puts 'Autopublishing journal tweet'
    puts autopost.postFromJournal
  end

  if trending_count > 120
    puts 'Autopublishing trending topic'
    puts autopost.postTrendingTopic
    trending_count = 0
  end

  sleep 60
  trending_count = +1
  journal_count = +1
end

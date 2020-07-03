require_relative '../lib/autopost.rb'
require 'dotenv'
Dotenv.load('../config.env')

autopost = Autopost.new('production')
twitt = Twitt.new("production")
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

  if journal_count > ENV["TRENDING_PUBLISH"].to_i
    puts 'Autopublishing journal tweet'
    puts autopost.postFromJournal
  end

  if trending_count > ENV["JOURNAL_PUBLISH"].to_i
    puts 'Autopublishing trending topic'
    puts autopost.postTrendingTopic
    trending_count = 0
  end

  sleep 60
  trending_count = +1
  journal_count = +1
end

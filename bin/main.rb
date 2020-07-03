require_relative '../lib/autopost.rb'
require 'dotenv'
Dotenv.load('../config.env')

autopost = Autopost.new('production')
twitt = Twitt.new('production')
trending_count = 0
journal_count = 0

puts '--------Twitter Bot--------'

loop do
  puts "#{autopost.journal_remain} remaining tweets in the journal"

  mentions = twitt.new_mentions
  puts 'New mentions: ' + mentions.size.to_s

  unless mentions.empty?
    mentions.each do |mention|
      puts "From: #{mention.user.name} @#{mention.user.screen_name}"
      puts mention.text
      puts 'Replying'
      puts autopost.reply(mention)
    end
  end

  if journal_count > ENV['TRENDING_PUBLISH'].to_i
    puts 'Autopublishing journal tweet'
    puts autopost.post_from_journal
  end

  if trending_count > ENV['JOURNAL_PUBLISH'].to_i
    puts 'Autopublishing trending topic'
    puts autopost.post_trending_topic
    trending_count = 0
  end

  sleep 60
  trending_count = +1
  journal_count = +1
end

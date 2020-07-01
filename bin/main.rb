require_relative '../lib/twitt.rb'
require_relative '../lib/tweetIntent.rb'

twitt=Twitt.new
intent=TweetIntent.new


mentions =twitt.getNewMentions
mentions.each {|mention| puts mention::text}

puts intent.checkIntent("help @adfpizarro")

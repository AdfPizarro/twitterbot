require_relative '../lib/autopost.rb'

autopost=Autopost.new
twitt=Twitt.new
intent=TweetIntent.new


mentions =twitt.getNewMentions
mentions.each {|mention| autopost.reply(mention)}

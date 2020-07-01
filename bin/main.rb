require_relative '../lib/twitt.rb'
twitt=Twitt.new




mentions =twitt.getNewMentions
mentions.each {|mention| puts mention::text}

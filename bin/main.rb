require_relative '../lib/twitt.rb'

twitt=Twitt.new


#twitt.tweet('Class test')

mentions =twitt.getMentions
#File.write('tweets.yml', YAML.dump(mentions))
mentions.each {|mention| puts mention::text}





##client.update('@ Hello human', in_reply_to_status_id: 1278077477471096833 )





#File.write('tweets.yml', YAML.dump(mentions))

#tweets = client.user_timeline('rubyinside', count: 20)
#tweets.each { |tweet| puts tweet.full_text }

#
#File.write('tweets.yml', YAML.dump(tweets))
#    client.update("Test")

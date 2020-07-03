require_relative '../lib/tweet_intent.rb'
require 'twitter'

describe TweetIntent do
  it '#Check intent greet' do
    tweet_intent = TweetIntent.new('test')
    intent = tweet_intent.check_intent('hi')
    expect(intent.to_s).to eql('greet')
  end

  it '#Check intent help' do
    tweet_intent = TweetIntent.new('test')
    intent = tweet_intent.check_intent('help')
    expect(intent.to_s).to eql('help')
  end

  it '#Check intent meme' do
    tweet_intent = TweetIntent.new('test')
    intent = tweet_intent.check_intent('fun')
    expect(intent.to_s).to eql('meme')
  end

  it '#Check intent not clear' do
    tweet_intent = TweetIntent.new('test')
    intent = tweet_intent.check_intent('aaaaaa')
    expect(intent.to_s).to eql('not clear')
  end
end

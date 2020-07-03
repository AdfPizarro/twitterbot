require_relative '../lib/tweetIntent.rb'

describe TweetIntent do


  it '#Check intent greet' do
    tweetIntent=TweetIntent.new('test')
    intent=tweetIntent.checkIntent('hi')
    expect(intent.to_s).to eql('greet')
  end

  it '#Check intent help' do
    tweetIntent=TweetIntent.new('test')
    intent=tweetIntent.checkIntent('help')
    expect(intent.to_s).to eql('help')
  end

  it '#Check intent meme' do
    tweetIntent=TweetIntent.new('test')
    intent=tweetIntent.checkIntent('fun')
    expect(intent.to_s).to eql('meme')
  end

  it '#Check intent not clear' do
    tweetIntent=TweetIntent.new('test')
    intent=tweetIntent.checkIntent('aaaaaa')
    expect(intent.to_s).to eql('not clear')
  end

end

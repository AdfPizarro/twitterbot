require_relative '../lib/twitt.rb'

describe Twitt do
#  it '#Post a tweet' do
#    twitt = Twitt.new("test")
#    res = twitt.tweet('Unit test')
#    expect(res.class.to_s).to eql('Twitter::Tweet')
#  end

  it '#Get all mentions' do
    twitt = Twitt.new("test")
    res = twitt.getAllMentions
    expect(res.class.to_s).to eql('Array')
  end

  it '#Get new Trendings' do
    twitt = Twitt.new("test")
    res = twitt.getTrendings
    expect(res.class.to_s).to eql('String')
  end

end

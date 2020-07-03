require_relative '../lib/autopost.rb'

describe Autopost do
  it '#Get journal remaining tweets' do
    autopost = Autopost.new('test')
    res = autopost.getJournalRemain
    expect(res.class).to eql(Integer)
  end

  it '#Post from journal' do
    autopost = Autopost.new('test')
    res = autopost.postFromJournal
    expect(res.class).to eql(String)
  end

  it '#Post a trending' do
    autopost = Autopost.new('test')
    res = autopost.postTrendingTopic
    expect(res.class).to eql(String)
  end


end

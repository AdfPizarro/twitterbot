require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Player do
  it 'Check inint player 1' do
    player = Player.new
    expect(player.player).to eql(1)
  end

  it 'Check switch player 1 to 2' do
    player = Player.new
    board = Board.new(1..9)
    player.move(1, board)
    expect(player.player).to eql(2)
  end

  it 'Check inint player 1 symbol ' do
    player = Player.new
    expect(player.symbol).to eql('X')
  end

  it 'Check switch player 1 to 2 symbol' do
    player = Player.new
    board = Board.new(1..9)
    player.move(1, board)
    expect(player.symbol).to eql('●')
  end

  it 'Player make a valid movement' do
    player = Player.new
    board = Board.new(1..9)
    expect(player.move(1, board)).to eql(true)
  end

  it 'Player make an ivalid movement' do
    player = Player.new
    board = Board.new(1..9)
    player.move(1, board)
    expect(player.move(1, board)).to eql(false)
  end
end

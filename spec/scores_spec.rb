require_relative '../lib/scores.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Scores do
  it 'Add score player 1' do
    scores = Scores.new
    scores.score(1, 'win')
    expect(scores.player1).to eql(1)
  end

  it 'Add score player 2' do
    scores = Scores.new
    scores.score(2, 'win')
    expect(scores.player2).to eql(1)
  end

  it 'Add score to draw count' do
    scores = Scores.new
    scores.score(2, 'draw_board')
    expect(scores.draw).to eql(1)
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
end

require_relative '../lib/board.rb'

describe Board do
  it 'Check valid movement pos 1' do
    board = Board.new(1..9)
    expect(board.set_board(1, 1)).to eql(true)
  end

  it 'Check if game ends player 1 wins first horizontal' do
    board = Board.new(1..9)
    board.set_board(1, 1)
    board.set_board(1, 2)
    board.set_board(1, 3)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins second horizontal' do
    board = Board.new(1..9)
    board.set_board(1, 4)
    board.set_board(1, 5)
    board.set_board(1, 6)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins third horizontal' do
    board = Board.new(1..9)
    board.set_board(1, 7)
    board.set_board(1, 8)
    board.set_board(1, 9)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins first vertical' do
    board = Board.new(1..9)
    board.set_board(1, 1)
    board.set_board(1, 4)
    board.set_board(1, 7)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins second vertical' do
    board = Board.new(1..9)
    board.set_board(1, 2)
    board.set_board(1, 5)
    board.set_board(1, 8)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins third vertical' do
    board = Board.new(1..9)
    board.set_board(1, 3)
    board.set_board(1, 6)
    board.set_board(1, 9)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins first diagonal' do
    board = Board.new(1..9)
    board.set_board(1, 7)
    board.set_board(1, 5)
    board.set_board(1, 3)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game ends player 1 wins second diagonal' do
    board = Board.new(1..9)
    board.set_board(1, 1)
    board.set_board(1, 5)
    board.set_board(1, 9)
    board.check_board
    expect(board.game_status).to eql('win')
  end

  it 'Check if game is draw' do
    board = Board.new(1..9)
    board.set_board(1, 1)
    board.set_board(2, 2)
    board.set_board(1, 3)
    board.set_board(2, 6)
    board.set_board(1, 4)
    board.set_board(2, 7)
    board.set_board(1, 5)
    board.set_board(2, 9)
    board.set_board(1, 8)
    board.check_board
    expect(board.game_status).to eql('draw')
  end

  it 'Check if the position is alredy picked' do
    board = Board.new(1..9)
    board.set_board(1, 1)
    expect(board.set_board(2, 1)).to eql(false)
  end

  it 'Check if the position is avaible' do
    board = Board.new(1..9)
    board.set_board(1, 1)
    expect(board.set_board(2, 2)).to eql(true)
  end

  it 'Check reset board function' do
    board = Board.new(1..9)
    board.reset_board
    expect(board.board).to eql((1..9).to_a)
  end

  it 'Check draw board function' do
    board = Board.new(1..9)
    top = "|7|8|9|\n"
    top += "|4|5|6|\n"
    top += '|1|2|3|'
    expect(board.draw_board).to eql(top)
  end
end

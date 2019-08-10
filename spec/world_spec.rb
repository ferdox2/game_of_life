require 'spec_helper'

RSpec.describe GameOfLife::World do
  describe '.initialize' do
    it 'creates a matrix with random numbers'
    board = new World.random(40)
    expect(board[].size).to eq(40)
  end

  it 'has a columns count' do
    board = World.new
    board.number_of_columns = 10
    expect(board.number_of_columns).to eq(10)
  end

  it 'has a rows count' do
    board = World.new
    board.number_of_rows = 10
    expect(board.number_of_rows).to eq(10)
  end
end

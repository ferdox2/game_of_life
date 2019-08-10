require 'matrix'

class Matrix
  def translate(row_count, col_count)
    Matrix[
      row_vectors.map do |row|
      row.to_a.rotate(row_count)
    end.rotate(col_count)
    ]
  end
end

class World
  attr_reader :width, :height

  def self.random(size)
    board = Matrix.build(size) { rand(10).zero? ? 1 : 0 }
    new(board)
  end

  def self.parse(board_string)
    new(Matrix[board_string.split("\n").map { |row| row.split.map(&:to_i) }])
  end

  def initialize(board)
    @width = board.column_size
    @height = board.row_size
    @board = board
  end

  def next
    board_state = neighbor_counts.map.with_index do |count, idx|
      count == 3 || count == 4 && @board[idx / width, idx % width] == 1 ? 1 : 0
    end
    World.new(board_state)
  end

  def print_board
    @board.row_vectors.map do |row|
      row.map do |status|
        status == 1 ? 'O' : '·'
      end.to_a.join(' ')
    end.join("\n")
  end

  def neighbor_counts
    [-1, 0, 1].product([-1, 0, 1]).map do |row, col|
    @board.translate(row, col)
    end.reduce(:+)
  end
end

require_relative "game_of_life/version"
require_relative 'game_of_life/cell'
require_relative 'game_of_life/world'

module GameOfLife
  class Error < StandardError; end
  # Your code goes here...
  world = World.random(40)
  loop do
    puts world.print_board
    sleep 0.3
    world = world.next
  end
end

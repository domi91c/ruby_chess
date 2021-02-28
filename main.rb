require 'ruby2d'
require 'board'
require 'fen_interpreter'

set title: "Chess"
set height: 1000
set width: 1000

starting_position = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
positions = FenInterpreter.call(starting_position)
@board = Board.new
@board.squares.each do |square|
  square.set_piece positions[square.name] if positions.key?(square.name)
end
show

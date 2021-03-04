require "ruby2d"
require "chess_board"
require "fen_interpreter"
require "legal_move_finder"

set title: "Chess"
set height: 1000
set width: 1000

board = ChessBoard.new

starting_position = "rnbqkbnr/pppppppp/7/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
positions = FenInterpreter.call(starting_position)

squares = board.squares
squares.each do |square|
  square.piece = positions[square.name] if positions.key?(square.name)
end

on :mouse_down do |event|
  if event.button == :left
    squares.map do |square|
      if square.clicked?(event.x, event.y)
        square.selected? ? square.deselect : square.select
        legal_moves = LegalMoveFinder.new(squares).moves_for(square)
        squares.each do |square|
          square.piece = positions[square.name] if positions.key?(square.name)
        end
      else
        square.deselect
      end
    end
  end
end

show

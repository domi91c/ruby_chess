require 'ruby2d'
require 'chess_board'
require 'fen_interpreter'
require 'legal_move_finder'
require 'chess_controller'

require 'views'
require 'views/board_view'

set title: 'Chess'
set height: 1000
set width: 1000

chess_board = ChessBoard.new
binding.pry

# pp chess_board.bitboards_to_array
model = Models::Game.new
board_view = Views::BoardView.new(model)
chess = ChessController.new(model)

on :mouse_down do |event|
  if event.button == :left
    board_view.square_views.each do |_, square_view|
      chess.click_square(square_view.name) if square_view.clicked?(event.x, event.y)
    end
  end
end

show
# on :mouse_down do |event|
#   if event.button == :left
#     squares.map do |square|
#       chess.click(event.x, event.y)
#       if square.clicked?(event.x, event.y)
#         square.selected? ? square.deselect : square.select
#         legal_moves = LegalMoveFinder.new(squares).moves_for(square)
#         squares.each do |square|
#           square.piece = positions[square.name] if positions.key?(square.name)
#         end
#       else
#         square.deselect
#       end
#     end
#   end
# end

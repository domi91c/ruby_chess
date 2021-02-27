require 'ruby2d'
require 'board'

set title: "Chess"
set height: 1000
set width: 1000

@board = Board.new
@board.squares['a1'].set_piece(:w_rook)
@board.squares['b1'].set_piece(:w_knight)
@board.squares['c1'].set_piece(:w_bishop)
@board.squares['d1'].set_piece(:w_king)
@board.squares['e1'].set_piece(:w_queen)
@board.squares['f1'].set_piece(:w_bishop)
@board.squares['g1'].set_piece(:w_knight)
@board.squares['h1'].set_piece(:w_rook)
@board.squares['a2'].set_piece(:w_pawn)
@board.squares['b2'].set_piece(:w_pawn)
@board.squares['c2'].set_piece(:w_pawn)
@board.squares['d2'].set_piece(:w_pawn)
@board.squares['e2'].set_piece(:w_pawn)
@board.squares['f2'].set_piece(:w_pawn)
@board.squares['g2'].set_piece(:w_pawn)
@board.squares['h2'].set_piece(:w_pawn)

@board.squares['a8'].set_piece(:b_rook)
@board.squares['b8'].set_piece(:b_knight)
@board.squares['c8'].set_piece(:b_bishop)
@board.squares['d8'].set_piece(:b_king)
@board.squares['e8'].set_piece(:b_queen)
@board.squares['f8'].set_piece(:b_bishop)
@board.squares['g8'].set_piece(:b_knight)
@board.squares['h8'].set_piece(:b_rook)
@board.squares['a7'].set_piece(:b_pawn)
@board.squares['b7'].set_piece(:b_pawn)
@board.squares['c7'].set_piece(:b_pawn)
@board.squares['d7'].set_piece(:b_pawn)
@board.squares['e7'].set_piece(:b_pawn)
@board.squares['f7'].set_piece(:b_pawn)
@board.squares['g7'].set_piece(:b_pawn)
@board.squares['h7'].set_piece(:b_pawn)

show

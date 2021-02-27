module BoardInfo
  FILES = %w(a b c d e f g h)
  RANKS = [1, 2, 3, 4, 5, 6, 7, 8].reverse
  SQUARE_SIZE = 125
  MARGIN = 20

  PIECES = {
    w_rook: "assets/w_rook.png",
    w_knight: "assets/w_knight.png",
    w_bishop: "assets/w_bishop.png",
    w_king: "assets/w_king.png",
    w_queen: "assets/w_queen.png",
    w_pawn: "assets/w_pawn.png",
    b_rook: "assets/b_rook.png",
    b_knight: "assets/b_knight.png",
    b_bishop: "assets/b_bishop.png",
    b_king: "assets/b_king.png",
    b_queen: "assets/b_queen.png",
    b_pawn: "assets/b_pawn.png",
  }
end

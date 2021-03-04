module BoardInfo
  SQUARE_SIZE = 125
  MARGIN = 20

  FILES = %w(a b c d e f g h)
  RANKS = [1, 2, 3, 4, 5, 6, 7, 8].reverse
  ALGEBRAIC_NOTATION = FILES.map do |file|
    RANKS.map do |rank|
      "#{file}#{rank}".to_sym
    end
  end

  PIECES = {
    R: "assets/w_rook.png",
    N: "assets/w_knight.png",
    B: "assets/w_bishop.png",
    K: "assets/w_king.png",
    Q: "assets/w_queen.png",
    P: "assets/w_pawn.png",
    r: "assets/b_rook.png",
    n: "assets/b_knight.png",
    b: "assets/b_bishop.png",
    k: "assets/b_king.png",
    q: "assets/b_queen.png",
    p: "assets/b_pawn.png",
  }

  SELECTED_PIECES = {
    R: "assets/w_rook_shadow.png",
    N: "assets/w_knight_shadow.png",
    B: "assets/w_bishop_shadow.png",
    K: "assets/w_king_shadow.png",
    Q: "assets/w_queen_shadow.png",
    P: "assets/w_pawn_shadow.png",
    r: "assets/b_rook_shadow.png",
    n: "assets/b_knight_shadow.png",
    b: "assets/b_bishop_shadow.png",
    k: "assets/b_king_shadow.png",
    q: "assets/b_queen_shadow.png",
    p: "assets/b_pawn_shadow.png",
  }
end

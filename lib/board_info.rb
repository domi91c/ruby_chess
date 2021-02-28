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
    r: "assets/w_rook.png",
    n: "assets/w_knight.png",
    b: "assets/w_bishop.png",
    k: "assets/w_king.png",
    q: "assets/w_queen.png",
    p: "assets/w_pawn.png",
    R: "assets/b_rook.png",
    N: "assets/b_knight.png",
    B: "assets/b_bishop.png",
    K: "assets/b_king.png",
    Q: "assets/b_queen.png",
    P: "assets/b_pawn.png",
  }
end

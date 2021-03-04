class LegalMoveFinder
  def initialize(squares)
    @squares = squares
  end

  def moves_for(square)
    case square.piece
    when :pawn
      binding.pry
      squares
    end
  end
end

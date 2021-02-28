require "board_info"

class ChessSquare
  include BoardInfo

  attr_reader :file, :rank, :colour, :piece

  def initialize(file, rank, colour)
    @file = file
    @rank = rank
    @colour = colour
    draw_square
  end

  def set_piece(piece_name)
    @piece = piece_name
    @rendered_piece.remove if @rendered_piece
    draw_piece
  end

  def name
    "#{file}#{rank}".to_sym
  end

  private

  def draw_square
    hex_value = colour == :light ? "#f6f8e1" : "#e7a98e"

    Square.new(
      x: SQUARE_SIZE * FILES.index(file), y: SQUARE_SIZE * RANKS.index(rank),
      size: SQUARE_SIZE,
      color: hex_value,
      z: 0,
    )
  end

  def draw_piece
    @rendered_piece = Image.new(
      PIECES[piece],
      width: SQUARE_SIZE - (MARGIN * 2), height: SQUARE_SIZE - (MARGIN * 2),
      x: x_pos + MARGIN, y: y_pos + MARGIN, z: 1,
    )
  end

  def x_pos
    SQUARE_SIZE * FILES.index(file)
  end

  def y_pos
    SQUARE_SIZE * RANKS.index(rank)
  end
end

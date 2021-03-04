require "board_info"

class ChessSquare
  include BoardInfo

  attr_reader :renders, :file, :rank, :colour, :piece

  def initialize(file, rank, colour)
    @file = file
    @rank = rank
    @colour = colour
    draw_square
  end

  def renders
    {
      piece: @rendered_piece,
      square: @rendered_square,
      selection: @rendered_selection
    }
  end

  def name
    "#{file}#{rank}".to_sym
  end

  def piece=(piece_name)
    @piece = piece_name
    @rendered_piece.remove if @rendered_piece
    draw_piece(shadow: selected?)
  end

  def select
    return unless piece

    @selected = true
    draw_selection
  end

  def deselect
    @selected = false
    erase_selection
  end

  def clicked?(x, y)
    renders[:square].contains?(x, y)
  end

  def selected?
    @selected
  end

  private

  def draw_square
    hex_value = colour == :light ? "#f6f8e1" : "#e7a98e"

    @rendered_square = Square.new(
      x: SQUARE_SIZE * FILES.index(file), y: SQUARE_SIZE * RANKS.index(rank),
      size: SQUARE_SIZE,
      color: hex_value,
      z: 0,
    )
  end

  def draw_selection
    @rendered_selection = Circle.new(
      x: x_pos + (SQUARE_SIZE / 2), y: y_pos + (SQUARE_SIZE / 2),
      radius: 60,
      color: "#3971ed",
      opacity: 0.3,
      z: 1,
    )
  end

  def erase_selection
    @rendered_selection&.remove
  end

  def draw_piece(shadow: false)
    @rendered_piece = Image.new(
      shadow ? SELECTED_PIECES[piece] : PIECES[piece],
      width: SQUARE_SIZE - (MARGIN * 2), height: SQUARE_SIZE - (MARGIN * 2),
      x: x_pos + MARGIN, y: y_pos + MARGIN, z: 2,
    )
  end

  def erase_piece
    @rendered_piece&.remove
  end

  def x_pos
    SQUARE_SIZE * FILES.index(file)
  end

  def y_pos
    SQUARE_SIZE * RANKS.index(rank)
  end
end

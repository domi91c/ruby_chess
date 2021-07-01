require "board_info"

class Views::SquareView
  include BoardInfo

  DARK_COLOUR = "#b48863"
  LIGHT_COLOUR = "#efd9b5"
  HIGHLIGHT_COLOUR = "#64535c"
  SELECTION_COLOUR = "#cdd06a"
  OPACITY = 0.7

  attr_accessor :x, :y, :name, :selected, :possible_move, :shapes

  def initialize(model, name, x, y, colour)
    @model = model
    @shapes = {}
    @x = x
    @y = y
    @colour = colour
    @name = name
    model.add_observer(self)
    draw_square
  end

  def square
    @model[name]
  end

  # Resets all shapes (except background square) upon change of model state.
  def update
    remove_shape(:piece)
    remove_shape(:selection)
    remove_shape(:select_highlight_square)
    remove_shape(:move_highlight_circle)
    remove_shape(:capture_highlight_square)
    remove_shape(:capture_highlight_circle)

    draw_piece square.piece if square.piece
    draw_select_highlight if square.selected?
    draw_highlight if square.highlighted?
  end

  def draw_square
    @shapes[:square] = Square.new(
      x: x, y: y,
      size: SQUARE_SIZE,
      color: @colour == :light ? LIGHT_COLOUR : DARK_COLOUR,
      z: 0,
    )
  end

  def clicked?(x, y)
    @shapes[:square].contains?(x, y)
  end

  private

  def remove_shape(shape)
    @shapes[shape]&.remove
  end

  def draw_piece(piece)
    remove_shape(:piece)

    @shapes[:piece] = Image.new(
      PIECE_IMAGES[piece],
      x: x + MARGIN, y: y + MARGIN, z: 2,
      width: SQUARE_SIZE - (MARGIN * 2), height: SQUARE_SIZE - (MARGIN * 2),
    )
  end

  def draw_highlight
    remove_shape(:highlight)

    if square.selected?
      draw_select_highlight
    elsif square.piece
      draw_capture_highlight
    else
      draw_move_highlight
    end
  end

  def draw_select_highlight
    remove_shape(:selection)

    @shapes[:select_highlight_square] = Square.new(
      x: x, y: y,
      size: SQUARE_SIZE,
      color: SELECTION_COLOUR,
      opacity: OPACITY,
      z: 1,
    )
  end

  def draw_move_highlight
    @shapes[:move_highlight_circle] = Circle.new(
      x: x + (SQUARE_SIZE / 2), y: y + (SQUARE_SIZE / 2),
      radius: 20,
      sectors: 32,
      color: HIGHLIGHT_COLOUR,
      opacity: OPACITY,
      z: 1,
    )
  end

  def draw_capture_highlight
    @shapes[:capture_highlight_square] = Square.new(
      x: x, y: y,
      size: SQUARE_SIZE,
      color: HIGHLIGHT_COLOUR,
      opacity: OPACITY,
      z: 1,
    )
    @shapes[:capture_highlight_circle] = Circle.new(
      x: x + (SQUARE_SIZE / 2), y: y + (SQUARE_SIZE / 2),
      radius: 62,
      sectors: 64,
      color: @colour == :light ? LIGHT_COLOUR : DARK_COLOUR,
      z: 1,
    )
  end
end

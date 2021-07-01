require "models/game"
require "views/board_view"

class ChessController
  def initialize(model)
    @model = model
  end

  def click_square(name)
    square = @model[name]

    if square.highlighted?
      selected_square = @model.selected_square
      @model.move(selected_square.name, square.name)
    else
      @model.select(name)
    end
  end
end

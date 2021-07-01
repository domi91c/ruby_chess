require 'board_info'
require 'views'
require 'views/square_view'

class Views::BoardView
  include BoardInfo

  attr_reader :square_views

  def initialize(model)
    @model = model
    @square_views = {}
    draw_board
    @model.save
  end

  private

  def draw_board
    colour_flag = true

    FILES.each do |file|
      RANKS.each do |rank|
        square_name = "#{file}#{rank}".to_sym
        colour = colour_flag ? :light : :dark
        @square_views[square_name] =
          Views::SquareView.new(
            @model,
            square_name,
            SQUARE_SIZE * FILES.index(file),
            SQUARE_SIZE * RANKS.index(rank),
            colour,
          )
        colour_flag = !colour_flag
      end
      colour_flag = !colour_flag
    end
  end
end

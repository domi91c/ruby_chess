require "pry"
require "ruby2d"

require "chess_square"
require "board_info"

class Board
  attr_accessor :squares
  include BoardInfo

  def initialize()
    @squares = {}
    colour_flag = true

    FILES.each do |file|
      RANKS.each do |rank|
        @squares["#{file}#{rank}"] = ChessSquare.new(
          file,
          rank,
          colour_flag ? :dark : :light,
        )
        colour_flag = !colour_flag
      end
      colour_flag = !colour_flag
    end
  end
end

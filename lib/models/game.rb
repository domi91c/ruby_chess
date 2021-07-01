require "observer"
require "models"
require "models/square"
require "board_info"
require "fen_interpreter"

class Models::Game
  include Observable
  include BoardInfo

  attr_accessor :squares, :selected_square

  def initialize()
    @squares = []
    FILES.each_with_index do |file, file_idx|
      RANKS.each_with_index do |rank, rank_idx|
        @squares << Models::Square.new(file, rank, file_idx, rank_idx)
      end
      colour_flag = !colour_flag
    end

    default_game
  end

  def save
    changed
    notify_observers
  end

  def [](square_name)
    @squares.find { |square| square.name == square_name }
  end

  def select(name)
    select_flag = !self[name].selected?

    squares.map do |square|
      square.selected = false
      square.highlighted = false
    end

    self[name].selected = select_flag

    if self[name].selected
      @selected_square = self[name]
      legal_moves = LegalMoveFinder.new(self).moves_for(name)
      legal_squares =
        squares.select { |square| legal_moves.include? square.name }
      legal_squares.map { |square| square.highlighted = true }
    end

    save
  end

  def move(from, to)
    return unless self[from]&.piece

    self[to].piece = self[from].piece
    self[from].piece = nil

    squares.map do |square|
      square.selected = false
      square.highlighted = false
    end

    save
  end

  private

  def default_game
    starting_position =
      "rnbqkbnr/pppppppp/7/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
    positions = FenInterpreter.call(starting_position)
    squares.each do |square|
      square.piece = positions[square.name] if positions.key?(square.name)
    end
  end
end

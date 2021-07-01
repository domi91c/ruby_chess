require 'board_info'

class LegalMoveFinder
  include BoardInfo
  def initialize(game_model)
    @game_model = game_model
  end

  def moves_for(name)
    p "calculating move for #{name}"
    square = @game_model[name]

    result =
      case square.piece.downcase
      when :p
        remove_out_of_bounds(directional_pawn_moves(square.file_idx, square.rank_idx, square.piece))
      else
        []
      end

    indices_to_algebraic(result)
  end

  private

  def directional_pawn_moves(file_idx, rank_idx, piece)
    if piece == :P
      [[file_idx, rank_idx - 1], [file_idx, rank_idx - 2]]
    elsif piece == :p
      [[file_idx, rank_idx + 1], [file_idx, rank_idx + 2]]
    end
  end

  def indices_to_algebraic(pairs)
    pairs.map do |pair|
      "#{FILES[pair[0]]}#{RANKS[pair[1]]}".to_sym
    end
  end

  def remove_out_of_bounds(pairs)
    pairs.reject do |pair|
      pair[0] < 0 || pair[1] < 0 || pair[0] > 7 || pair[1] > 7
    end
  end
end

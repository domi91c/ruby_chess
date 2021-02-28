require "pry"
require "board_info"

class FenInterpreter
  include BoardInfo

  def self.call(fen_string)
    # fen = fen_string.split("")
    # simplifying this for now by splitting out extra details
    fen = fen_string.split(" ")[0].split("")
    file_idx = 0
    rank_idx = 0
    files = FILES
    ranks = RANKS

    fen.each_with_object({}) do |n, result|
      if n =~ /[A-Za-z]/ # n is a piece
        current_square = "#{files[file_idx]}#{ranks[rank_idx]}".to_sym
        result[current_square] = n.to_sym
        file_idx += 1
      elsif n == "/" # n tells us to go to next rank
        rank_idx += 1
        file_idx = 0
      else # n is a number of spaces to skip
        file_idx += n.to_i
      end
    end
  end
end

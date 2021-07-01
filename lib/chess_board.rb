require 'ruby-prof'

class ChessBoard
  attr_reader :starting_position,
    :black_rooks,
    :black_knights,
    :black_bishops,
    :black_king,
    :black_queen,
    :black_pawns,
    :white_rooks,
    :white_knights,
    :white_bishops,
    :white_king,
    :white_queen,
    :white_pawns

  def initialize
    # for easier configurability
    @starting_position = [
      %w[r n b q k b n r],
      %w[p p p p p p p p],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      %w[P P P P P P P P],
      %w[R N B Q K B N R],
    ]

    @black_rooks   = 0
    @black_knights = 0
    @black_bishops = 0
    @black_king    = 0
    @black_queen   = 0
    @black_pawns   = 0

    @white_pawns   = 0
    @white_queen   = 0
    @white_king    = 0
    @white_bishops = 0
    @white_knights = 0
    @white_rooks   = 0

    array_to_bitboards(@starting_position)
  end

  def array_to_bitboards(array)
    for i in 0..63 do
      bit_string =
        '0000000000000000000000000000000000000000000000000000000000000000'
      binding.pry if i > 62
      bit_string = bit_string[i] + '1' + bit_string[0...i]
      case array[i / 8][i % 8]
      when 'R'
        @white_rooks += convert_string_to_bitboard(bit_string)
      when 'N'
        @white_knights += convert_string_to_bitboard(bit_string)
      when 'B'
        @white_bishops += convert_string_to_bitboard(bit_string)
      when 'Q'
        @white_queen += convert_string_to_bitboard(bit_string)
      when 'K'
        @white_king += convert_string_to_bitboard(bit_string)
      when 'P'
        @white_pawns += convert_string_to_bitboard(bit_string)
      when 'r'
        @black_rooks += convert_string_to_bitboard(bit_string)
      when 'n'
        @black_knights += convert_string_to_bitboard(bit_string)
      when 'b'
        @black_bishops += convert_string_to_bitboard(bit_string)
      when 'q'
        @black_queen += convert_string_to_bitboard(bit_string)
      when 'k'
        @black_king += convert_string_to_bitboard(bit_string)
      when 'p'
        @black_pawns += convert_string_to_bitboard(bit_string)
      end
    end
  end

  def convert_string_to_bitboard(string)
    if string[0] == '0'
      string.to_i(2)
    else
      ('1' + string[2..]).to_i(2)
    end
  end

  def bitboards_to_array
    array = Array.new(8) { Array.new(8, ' ') }

    64.times do |i|
      array[i / 8][i % 8] = 'R' if @white_rooks[i] != 0
      array[i / 8][i % 8] = 'N' if @white_knights[i] != 0
      array[i / 8][i % 8] = 'B' if @white_bishops[i] != 0
      array[i / 8][i % 8] = 'Q' if @white_queen[i] != 0
      array[i / 8][i % 8] = 'K' if @white_king[i] != 0
      array[i / 8][i % 8] = 'P' if @white_pawns[i] != 0

      array[i / 8][i % 8] = 'r' if @black_rooks[i] != 0
      array[i / 8][i % 8] = 'n' if @black_knights[i] != 0
      array[i / 8][i % 8] = 'b' if @black_bishops[i] != 0
      array[i / 8][i % 8] = 'q' if @black_queen[i] != 0
      array[i / 8][i % 8] = 'k' if @black_king[i] != 0
      array[i / 8][i % 8] = 'p' if @black_pawns[i] != 0
    end

    array
  end
  def p_bb(int)
    int
      .to_s(2)
      .rjust(64, '0')
      .chars
      .each_slice(8)
      .map(&:join)
      .map {|str| p str }
  end
end

# white_king = 16
# bit_string = "010000000000000000000000000000000000000000000000000"
# bit_int = bit_string.to_i(2)
# white_king <<< bit_int

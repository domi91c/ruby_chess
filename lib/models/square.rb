class Models::Square
  attr_accessor :name, :file, :rank, :file_idx, :rank_idx, :piece, :selected, :highlighted
  alias selected? selected
  alias highlighted? highlighted

  def initialize(file, rank, file_idx, rank_idx)
    @file = file
    @rank = rank
    @file_idx = file_idx
    @rank_idx = rank_idx
  end

  def name
    "#{file}#{rank}".to_sym
  end

  def selected=(value)
    @selected = if value && piece
                  true
                else
                  false
                end
  end
end

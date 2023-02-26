class Card
  SYM = {
    hearts: "\u2665",
    spades: "\u2660",
    diamonds: "\u2666",
    clubs: "\u2663"
  }.freeze

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{@rank}#{SYM[@suit]}"
  end
end

class PackCards
  attr_reader :cards

  def initialize
    @cards = init
  end

  def init
    cards = []
    suits = %i[hearts spades diamonds clubs]
    nominals = ['2', '3', '4', '5', '6', '7', '8', '9', '10', :jack, :queen, :king, :ace]

    suits.each { |s| nominals.each { |n| cards.push({ s => n }) } }
    cards
  end

  def shuffle
    @cards.shuffle!
  end

  def take
    @cards.pop
  end
end

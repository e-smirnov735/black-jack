require_relative 'card'

class PackCards
  attr_reader :cards

  def initialize
    @cards = init
  end

  def init
    cards = []
    suits = %i[hearts spades diamonds clubs]
    ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', :J, :Q, :K, :A]

    suits.each { |s| ranks.each { |r| cards.push(Card.new(s, r)) } }
    cards
  end

  def shuffle
    @cards.shuffle!
  end

  def take
    @cards.pop
  end
end

# pack = PackCards.new
# p pack.cards.size
# p pack.take
# p pack.shuffle
# p pack.take
# p pack.cards.size

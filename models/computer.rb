require_relative 'player'

class Computer < Player
  attr_reader :name

  def initialize
    super
    @name = 'Dealer'
  end

  def print_cards
    @cards.map(&:to_s).join(' ') #  @cards.map { |_c| '***' }.join(' ')
  end

  def another_card?(score)
    score < 17
  end
end

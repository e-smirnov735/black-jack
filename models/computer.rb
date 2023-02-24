require_relative 'player'

class Computer < Player
  def print_cards
    @cards.map { |_c| '***' }.join(' ')
  end

  def another_card?(score)
    score < 17
  end
end

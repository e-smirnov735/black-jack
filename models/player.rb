class Player
  attr_reader :money, :cards

  def initialize
    @money = 100
    @cards = []
  end

  def place_bet(bet)
    @money -= bet
  end

  def get_win(bank)
    @money += bank
  end

  def take_card(card)
    @cards.push(card)
  end

  def print_cards
    @cards.map(&:to_s).join(' ')
  end
end

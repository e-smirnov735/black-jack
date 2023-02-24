class Player
  attr_reader :money, :cards

  def initialize
    @money = 100
    @cards = []
  end

  def place_bet
    @money -= 10
  end

  def get_win(bank)
    @money += bank
  end

  def take_card(card)
    @cards.push(card)
  end

  

end

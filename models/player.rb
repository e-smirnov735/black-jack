class Player
  def initialize
    @money = 100
    @cards = []

  def place_bet
    @money -= 10
   end

  def get_win(bank)
    @money += bank
  end

  def points
  end
end

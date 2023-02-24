require_relative 'user'
require_relative 'computer'
require_relative 'pack_cards'
require_relative 'calculator'
require_relative 'menu'

class Game
  include Calculator
  include Menu

  def initialize
    @user = User.new
    @dealer = Computer.new
    @pack = PackCards.new
  end

  def start
    name = ask('What is your name? ')
    @user.name = name

    @pack.shuffle
    card_draw
    menu_start
  end

  def card_draw
    @user.place_bet
    @dealer.place_bet

    2.times do
      @user.take_card(@pack.take)
      @dealer.take_card(@pack.take)
    end

    print_cards
  end

  def take_card
    @user.take_card
  end

  def dealer_step
    score = calculate(@dealer.cards)
    @dealer.take_card if @dealer.another_card?(score)
  end

  def check_result; end

  def end_game; end

  private

  def print_cards
    puts "мои карты: #{@user.print_cards}, карты дилера: #{@dealer.print_cards}}"
    puts "количество очков: #{calculate(@user.cards)}"
  end
end

game = Game.new
game.start

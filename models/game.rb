require_relative 'user'
require_relative 'computer'
require_relative 'pack_cards'
require_relative 'calculator'
require_relative 'menu'

class Game
  include Calculator
  include Menu

  BET = 10

  def initialize
    @user = User.new
    @dealer = Computer.new
    @pack = PackCards.new
  end

  def start
    @user.name ||= ask('What is your name? ')

    @pack.shuffle
    card_draw
    start_menu(main_menu)
    start_menu(final_menu)
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
    puts 'вам добавлена карта'
    @user.take_card(@pack.take)
    dealer_step
  end

  def dealer_step
    puts 'Дилер делает ход'
    score = calculate(@dealer.cards)
    @dealer.take_card(@pack.take) if @dealer.another_card?(score)
    check_result
  end

  def next_round
    @pack = PackCards.new
    @user.cards.clear
    @dealer.cards.clear
    start
  end

  def check_result
    user_score = calculate(@user.cards)
    dealer_score = calculate(@dealer.cards)
    winner = who_wins(user_score, dealer_score)
    winner_calculate(winner)
  end

  private

  def winner_calculate(winner)
    case winner
    when -1
      @user.get_win(BET * 2)
      print_result(@user, @dealer)
    when 1
      @dealer.get_win(BET * 2)
      print_result(@dealer, @user)
    else
      @user.get_win(BET)
      @dealer.get_win(BET)
      print_result(nil, nil, true)
    end
  end

  def print_result(win, lose, draw: false)
    print_cards

    if draw
      puts "DRAW! очков поровну - #{calculate(win.cards)}"
      return
    end
    puts "#{win.name} win! количество очков #{calculate(win.cards)} против #{calculate(lose.cards)}"
    puts "Balance: #{@user.name}: #{@user.money}, #{@dealer.name}: #{@dealer.money}"
  end

  def print_cards
    puts "мои карты: #{@user.print_cards}, карты дилера: #{@dealer.print_cards}"
    puts "количество очков: #{calculate(@user.cards)}"
  end
end

game = Game.new
game.start

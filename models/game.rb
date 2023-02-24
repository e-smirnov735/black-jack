require_relative 'user'
require_relative 'computer'
require_relative 'pack_cards'

class Game
  def initialize
    @user = User.new
    @dealer = Computer.new
    @pack = PackCards.new
  end

  def start_game
    name = ask('What is your name? ')
    @user.name = name
  end

  def card_draw
    @user.take_card(@pack.take)
    @user.take_card(@pack.take)
    @dealer.take_card(@pack.take)
    @dealer.take_card(@pack.take)
    print_cards(@user.cards, @dealer.cards)
  end

  def check_result; end

  def end_game; end

  private

  def print_cards(user_cards, dealer_cards)
    puts "мои карты: #{user_cards}, карты дилера: #{dealer_cards}}"

  def greeting; end

  def ask(question)
    print question
    gets.chomp
  end
end

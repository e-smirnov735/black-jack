module Menu
  def main_menu
    {
      1 => { description: 'Пропустить',
             action: -> { dealer_step } },
      2 => { description: 'Добавить карту',
             action: -> { take_card } },
      3 => { description: 'Открыть карты',
             action: -> { open_card } }
    }
  end

  def final_menu
    {
      1 => { description: 'Следующий раунд',
             action: -> { next_round } },
      2 => { description: 'Закончить игру',
             action: -> { 'Спасибо за игру!' } }
    }
  end

  def start_menu(menu)
    show_menu(menu)
    choice = gets.chomp.to_i
    category = menu[choice]
    puts category[:description]
    category[:action].call
    choice == 3
  end

  def show_menu(menu)
    menu.each { |key, value| puts "#{key} -> #{value[:description]}\n" }
  end

  def ask(question)
    print question
    gets.chomp
  end
end

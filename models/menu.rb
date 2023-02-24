module Menu
  def main_menu
    {
      1 => { description: 'Пропустить',
             action: -> { 'next step' } },
      2 => { description: 'Добавить карту',
             action: -> { 'add card' } },
      3 => { description: 'Открыть карты',
             action: -> { 'open card' } }
    }
  end

  def final_menu
    {
      1 => { description: 'Следующий раунд',
             action: -> { 'next step' } },
      2 => { description: 'Закончить игру',
             action: -> { 'add card' } }
    }
  end

  def start_menu(menu)
    show_menu(menu)
    choice = gets.chomp.to_i
    category = menu[choice]
    puts category[:description]

    category[:action].call
  end

  def show_menu(menu)
    menu.each { |key, value| puts "#{key} -> #{value[:description]}\n" }
  end

  def ask(question)
    print question
    gets.chomp
  end
end

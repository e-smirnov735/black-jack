module Calculator
  MAX_SCORE = 21
  RELATION = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
    :J => 10, :Q => 10, :K => 10, :A => 1
  }.freeze

  def calculate(cards)
    res = cards.inject(0) { |sum, el| sum + RELATION[el.rank] }
    cards.each { |el| res += 10 if el.rank == :A && res + 10 <= MAX_SCORE }
    res
  end

  def who_wins(first, second)
    return 1 if first > 21
    return -1 if second > 21

    second <=> first
  end
end

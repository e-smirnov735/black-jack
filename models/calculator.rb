module ScoreCalc
  RELATION = {
    '2' => 2, '3' => 3, '4' => 4, '5' => 5,
    '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10,
    :J => 10, :Q => 10, :K => 10, :A => 11
  }.freeze

  def calculate(cards)
    cards.inject(0) { |sum, el| sum + RELATION[el.rank] }
  end
end

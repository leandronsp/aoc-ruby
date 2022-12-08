require 'test/unit'

class LessonTest < Test::Unit::TestCase
  def scores = { 'A' => 1, 'B' => 2, 'C' => 3, lose: 0, draw: 3, win: 6 }

  def combinations
    {
      'X' => 'A',
      'Y' => 'B',
      'Z' => 'C',
      'B' => 'A',
      'C' => 'B',
      'A' => 'C'
    }
  end

  def winning(code) = combinations.invert[code]
  def losing(code) = combinations[code]

  def battle(attack, defense)
    return :win if winning(attack) == defense
    return :lose if losing(attack) == defense

    :draw
  end

  def guess_defense_code(attack, defense, swap_defense)
    return combinations[defense] unless swap_defense

    return attack if defense == 'Y'
    return winning(attack) if defense == 'Z'
    return losing(attack) if defense == 'X'
  end

  def total_score(input, swap_defense: false)
    battles = input.split("\n")

    battles.reduce(0) do |acc, battle|
      left, right = battle.split(" ")

      attack = left
      defense = guess_defense_code(attack, right, swap_defense)
      result = battle(attack, defense)

      acc += scores[defense] + scores[result]
    end
  end

  def test_simple
    input = "A Y\nB X\nC Z"

    assert_equal 15, total_score(input)
  end

  def test_simple_swap_defense
    input = "A Y\nB X\nC Z"

    assert_equal 12, total_score(input, swap_defense: true)
  end

  def test_complex
    input = File.read('2022/day-2/input')

    assert_equal 14069, total_score(input)
  end

  def test_complex_swap_defense
    input = File.read('2022/day-2/input')

    assert_equal 12411, total_score(input, swap_defense: true)
  end
end

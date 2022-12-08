require 'test/unit'

class LessonTest < Test::Unit::TestCase
  def calories_ranking(lines)
    acc = 0
    calories = []
    size = lines.size

    lines.each_with_index do |line, idx|
      next (calories << acc && acc = 0) if line.empty?

      acc += line.to_i
      calories << acc if idx == (size - 1)
    end

    sorted = calories.sort.reverse
    first, second, third = sorted.values_at(0, 1, 2)

    [first, (first + second + third)]
  end

  def test_simple
    lines = ["1", "2", "3", "", "3", "", "9", "10", "", "1", "6"]

    assert_equal [19, 32], calories_ranking(lines)
  end

  def test_complex
    raw   = File.read('2022/day-1/input')
    lines = raw.split("\n")

    assert_equal [68292, 203203], calories_ranking(lines)
  end
end

require 'test/unit'

class LessonTest < Test::Unit::TestCase
  def most_calories(lines)
    acc = 0
    most_calories = 0

    lines.each do |line|
      next acc = 0 if line.empty?

      acc += line.to_i
      most_calories = [most_calories, acc].max
    end

    most_calories
  end

  def test_simple
    lines = ["1", "2", "3", "", "3", "", "9", "10"]

    assert_equal 19, most_calories(lines)
  end

  def test_complex
    raw   = File.read('2022/1/input')
    lines = raw.split("\n")

    assert_equal 68292, most_calories(lines)
  end
end


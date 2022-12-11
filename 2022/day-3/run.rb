require 'test/unit'

class Day3Test < Test::Unit::TestCase
  def alphabet_idx
    @alphabet_idx ||=
      begin
        (('a'..'z').to_a + ('A'..'Z').to_a)
          .each_with_object({})
          .with_index do |(letter, acc), index|
            acc[letter] = index + 1
          end
      end
  end

  def priorities_sum(input)
    rucksacks = input.split("\n")

    rucksacks.sum(0) do |rucksack|
      compartments_size = rucksack.size / 2

      first_half = rucksack[0...compartments_size]
      second_half = rucksack[compartments_size..-1]

      repeated = first_half.chars & second_half.chars
      alphabet_idx[repeated.first]
    end
  end

  def test_simple
    input = "vJrwpWtwJgWrhcsFMMfFFhFp\njqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL\nPmmdzqPrVvPwwTWBwg\nwMqvLMZHhHMvwLHjbvcjnnSBnvTQFn\nttgJtRGJQctTZtZT\nCrZsJsPPZsGzwwsLwLmpwMDw"

    assert_equal 157, priorities_sum(input)
  end

  def test_complex
    input = File.read('2022/day-3/input')

    assert_equal 8153, priorities_sum(input)
  end
end

# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'logic'

class TestStr < Minitest::Test

  def test_first
    20.times do
      strs = gen_str
      assert_equal strs[1], correct_str(strs[0])
    end
  end

  def gen_word(n)
    chars = ('а'..'я').to_a
    (chars.sample rand(1..n)).join ''
  end

  def gen_str
    max_size = rand(7..10)
    min_size = rand(2..6)
    max_word = gen_word max_size
    min_word = gen_word min_size
    len = rand(2..10)
    num_min = rand(1..len)
    num_max = rand(1..len)
    num_max += 1 if num_max == num_min

    str = ''
    res = ''
    len.times do |i|
      if i != 0
        str += ' '
        res += ' '
      end
      if i == num_max
        str += max_word
        res += min_word
      elsif i == num_min
        str += min_word
        res += max_word
      else
        word = gen_word rand(min_size + 1...max_size)
        str += word
        res += word
      end
    end
    puts str
    puts res
    [str, res]
  end

end

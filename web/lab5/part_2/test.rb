# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'logic'

# class with test
class TestStr < Minitest::Test
  CHARS = ('а'..'я').to_a
  NUM_TESTS = 20

  def test_first
    NUM_TESTS.times do
      strings = gen_str
      assert_equal strings[1], correct_str(strings[0])
    end
  end

  def gen_word(len_word)
    (CHARS.sample len_word).join ''
  end

  def gen_str
    max_size = rand(7..10)
    min_size = rand(2..5)
    max_word = gen_word max_size
    min_word = gen_word min_size
    len_str = rand(3..10)
    max = false
    min = false

    arr_str = []
    arr_res = []
    len_str.times do |i|
      if i == rand(i...len_str - 1) && !max
        arr_str << [max_word]
        arr_res << [min_word]
        max = true
      elsif i == rand(i...len_str) && !min
        arr_str << [min_word]
        arr_res << [max_word]
        min = true
      else
        word = gen_word rand((min_size + 1)...max_size)
        arr_str << word
        arr_res << word
      end
    end
    [arr_str.join(' '), arr_res.join(' ')]
  end
end

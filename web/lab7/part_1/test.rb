# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'logic'

# class with test
class TestFile < Minitest::Test
  CHARS = ('a'..'z').to_a
  NUM_TESTS = 20

  def test_first
    NUM_TESTS.times do
      gen_file 'F', 'res'
      new_text_from_file_into_file 'F', 'G'
      assert_equal File.open('res', 'r').gets, File.open('G', 'r').gets
    end
  end

  def gen_file(file, file_res)
    arr_text = gen_str
    File.open(file, 'w') { |f| f.puts arr_text[0] }
    File.open(file_res, 'w') { |f| f.puts arr_text[1] }
  end

  def gen_str
    file_size = rand(20..40)
    arr_str = []
    arr_res = []
    file_size.times do
      char = CHARS.sample
      arr_str << [char]
      if char == 'a'
        while (char_next = CHARS.sample) == 'a'
        end
        arr_str << [char_next]
        arr_res << [char_next]
      end
    end
    [arr_str.join(''), arr_res.join('')]
  end

end

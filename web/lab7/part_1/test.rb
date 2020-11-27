# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'logic'

# class with test
class TestFile < Minitest::Test
  CHARS = ('a'..'z').to_a
  NUM_TESTS = 20

  def setup
    @file_f = 'F'
    @file_g = 'G'
    @file_res = 'res'
  end

  def test_first
    NUM_TESTS.times do
      gen_file @file_f, @file_res
      new_text_from_file_into_file @file_f, @file_g
      assert_equal File.open(@file_res, 'r').gets, File.open(@file_g, 'r').gets
    end
  end

  def gen_file(file_name, file_name_res)
    arr_text = gen_str
    File.open(file_name, 'w') { |file| file.puts arr_text[0] }
    File.open(file_name_res, 'w') { |file| file.puts arr_text[1] }
  end

  def rand_sym
    CHARS.sample
  end

  def gen_str
    file_size = rand(20..40)
    arr_str = []
    arr_res = []
    file_size.times do
      char = rand_sym
      arr_str << [char]
      next unless char == 'a'

      while (char_next = rand_sym) == 'a'
      end
      arr_str << [char_next]
      arr_res << [char_next]
    end
    [arr_str.join(''), arr_res.join('')]
  end

  def teardown
    File.delete(@file_f)
    File.delete(@file_g)
    File.delete(@file_res)
  end
end

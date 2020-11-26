require 'minitest/autorun'
require_relative 'logic'

# class with test
class TestMath < Minitest::Test
  NUM_TEST = 3

  def test_first
    res = 1.0 / 3.0
    del = 1e-2

    NUM_TEST.times do
      assert_in_delta(res, integral(del), del, 'Error in correct test')
      del /= 10.0
    end
  end
end

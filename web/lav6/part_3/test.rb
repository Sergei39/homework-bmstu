require 'minitest/autorun'
require_relative 'logic'

# class with test
class TestMath < Minitest::Test
  DEL = 1e-2
  def test_first
    res = 1.125
    func = ->(x) { Math::E**x / (x + 1) }
    assert_in_delta(res, integral(256, 1, 0, func), DEL, 'Error in test_first')
  end

  def test_second
    res = 2.0 / 3.0
    assert_in_delta(res, integral(256, 2, 0) { |x| x * (x - 1) }, DEL, 'Error in correct test_second')
  end
end

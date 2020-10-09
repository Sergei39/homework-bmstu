# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'logic'

class TestMath < Minitest::Test
  def test_first
    x = rand(-100..99)
    z = rand(-100..99)
    assert_in_delta (x**2 - 10) / Math.tan(6 * z - 6 * x), math_yr(x, z)
  end
end

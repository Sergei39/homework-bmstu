# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'logic'

# class with test
class TestMath < Minitest::Test
  def setup
    super
    @del = 0.001
    @message_incorrect = 'Error in test'
  end

  def rand_num
    rand(-100..99)
  end

  def test_first
    x_num = 5
    z_num = 12
    res = 6.546
    assert_in_delta(res, math_yr(x_num, z_num),
                    @del, @message_incorrect + ' 1')
  end

  def test_second
    x_num = rand_num
    z_num = rand_num
    assert_in_delta((x_num**2 - 10) / Math.tan(6 * z_num - 6 * x_num), math_yr(x_num, z_num),
                    @del, @message_incorrect + '2')
  end
end

# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

# class for test
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a
  def setup
    @sym = ALPHABET.sample
    @code = @sym.ord
    @font = 'TimeNewRoman'
  end

  def test_first
    assert_equal(SymbolFont.superclass, MySymbol)
  end

  def test_second
    refute_equal(MySymbol.superclass, SymbolFont)
  end

  def test_third
    test_object = SymbolFont.new(@sym, @font)
    assert_equal(@sym, test_object.sym)
    assert_equal(@code, test_object.code)
    assert_equal(@font, test_object.font)
  end
end

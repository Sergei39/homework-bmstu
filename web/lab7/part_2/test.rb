# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'logic'

# class for test
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a

  def test_first
    assert_equal(SymbolFont.superclass, MySymbol)
  end

  def test_second
    refute_equal(MySymbol.superclass, SymbolFont)
  end

  def test_third
    sym = ALPHABET.sample
    test_object = SymbolFont.new(sym, 'TimeNewRoman')
    assert_equal(sym, test_object.sym)
    assert_equal(sym.ord, test_object.code)
    assert_equal('TimeNewRoman', test_object.font)
  end
end

# frozen_string_literal: true

# base class
class MySymbol
  def initialize(sym = 'a')
    @sym = sym
    @code = @sym.ord
  end

  def print_sym
    puts @sym
  end

  attr_reader :sym
  attr_reader :code
end

# descendant oString class
class SymbolFont < MySymbol
  def initialize(sym = 'a', font = 'default')
    super sym
    @font = font
  end

  attr_reader :font
end

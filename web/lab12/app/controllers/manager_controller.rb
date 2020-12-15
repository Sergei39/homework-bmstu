
require 'prime'

class ManagerController < ApplicationController
  def input
  end

  def output
    number = params[:number].to_i
    if number.zero? && number != '0'
      @result = 'Please, input valid number'
    else
      @result = main_logic(number)
    end
  end

  def main_logic(number)
    prime = Prime.take_while { |pr| pr <= number * 2 }.select { |val| val >= number }
    count = -5
    prime.select do |val|
      diff = val - count
      count = val
      diff == 2
    end
  end
end

require 'prime'

class IoManagerController < ApplicationController
  def input

  end

  def output
    number = params[:number]
    if (number.to_i == 0) and (number != "0")
      @result = "Please, input valid number"
    else
      @result = main_logic(number.to_i)
    end
  end


  def main_logic(number)
    prime = Prime.take_while { |p| p <= number * 2 }.select { |x| x >= number }
    count = -5
    prime.select do |x|
      diff = x - count
      count = x
      diff == 2
    end
  end
end

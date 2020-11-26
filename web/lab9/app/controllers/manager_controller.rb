# frozen_string_literal: true

require 'prime'

# main controller
class ManagerController < ApplicationController
  def input
    render layout: false
  end

  def view
    number = params[:number].to_i
    if number.zero? && number != '0'
      @result = 'Please, input valid number'
    else
      @result = main_logic(number)
    end

    respond_to do |format|
      format.html
      format.json do
        render json:
                   { type: @result.class.to_s, value: @result }
      end
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

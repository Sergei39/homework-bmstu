# frozen_string_literal: true

require 'prime'

# controllers
class MethodController < ApplicationController
  def main_logic
    prime = Prime.take_while { |pr| pr <= @number * 2 }.select { |val| val >= @number }
    count = -5
    prime.select do |val|
      diff = val - count
      count = val
      diff == 2
    end
  end

  before_action :parse_params, only: :view

  def view
    if @number.zero? && @number != '0'
      @result = nil
    else
      if (res = Result.find_by_value(@number))
        @result = ActiveSupport::JSON.decode(res.result)

      else
        @result = main_logic

        res = Result.create value: @number, result: ActiveSupport::JSON.encode(@result)
        res.save
      end

    end

    respond_to do |format|
      format.html
      format.json do
        render json:
                 { type_result: @number.class.to_s, value_result: @number,
                   type_steps: @result.class.to_s, value_steps: @result }
      end
    end
  end

  def results
    result = Result.all.map { |el| { value: el.value, result: ActiveSupport::JSON.decode(el.result) } }

    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

  protected

  def parse_params
    @number = params[:number].to_i
  end
end

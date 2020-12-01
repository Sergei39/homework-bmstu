# frozen_string_literal: true

require 'prime'

# main controller
class XmlController < ApplicationController

  def main_logic
    prime = Prime.take_while { |pr| pr <= @number * 2 }.select { |val| val >= @number }
    count = -5
    prime.select do |val|
      diff = val - count
      count = val
      diff == 2
    end
  end

  before_action :parse_params, only: :index

  def index
    result = if @number.zero? && @number != '0'
               { message: 'Please, input valid number' }
             else
               main_logic.map { |elem| { elem_1: elem - 2, elem_2: elem } }
             end

    respond_to do |format|
      format.xml { render xml: result.to_xml }
      format.rss { render xml: result.to_xml }
    end
  end

  protected

  def parse_params
    @number = params[:number].to_i
  end


end

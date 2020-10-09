# frozen_string_literal: true

require_relative 'logic'

puts 'Hello'
puts 'Input x'
x = gets.to_f
puts 'Input z'
z = gets.to_f

puts 'Result: ' + foo(x, z).to_s

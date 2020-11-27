# frozen_string_literal: true

require_relative 'logic'

puts 'Choose a function:'
puts '1) e^x / (x + 1)'
puts '2) x * (x - 1)'
code = gets.to_i

puts 'Input step'
steps = gets.to_i
func = ->(x) { Math::E**x / (x + 1) }
if code == 1
  puts integral(steps, 1, 0, func)
else
  puts integral(steps, 2, 0) { |x| x * (x - 1) }
end

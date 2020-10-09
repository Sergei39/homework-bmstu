# frozen_string_literal: true

require_relative 'logic'

ARGF.each do |line|
  puts correct_string(line.chomp)
end

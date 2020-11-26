str = gets
array = str.split.map(&:to_i)

number = array.find { |i| i > 2 }
puts number
# array[array.each_with_index.min[1]] = number

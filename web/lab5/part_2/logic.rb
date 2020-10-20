# frozen_string_literal: true

def correct_str(str)
  str_arr = str.split
  minmax = str_arr.each_with_index.minmax_by { |word, _index| word.length }
  str_arr[minmax[0][1]] = minmax[1][0]
  str_arr[minmax[1][1]] = minmax[0][0]
  str_arr.join ' '
end

# frozen_string_literal: true

def correct_str(str)
  str_arr = str.split
  max = str_arr.max_by(&:size)
  min = str_arr.min_by(&:size)
  swap str, max, min
end

def swap(str, first, second)
  res = str.clone
  if res.index(first) > res.index(second)
    res.sub! first, second
    res.sub! second, first
  else
    res.sub! second, first
    res.sub! first, second
  end
  res
end

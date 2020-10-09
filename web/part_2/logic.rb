# frozen_string_literal: true

def correct_string(str)
  arr_str = str.split
  max = arr_str.max_by(&:size)
  min = arr_str.min_by(&:size)

  res = str.clone
  swap!(res, min, max)
  res
end

def swap!(str, str_a, str_b)
  if str.index(str_a) > str.index(str_b)
    str.sub!(str_a, str_b)
    str.sub!(str_b, str_a)
  else
    str.sub!(str_b, str_a)
    str.sub!(str_a, str_b)
  end
end

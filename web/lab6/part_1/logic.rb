# frozen_string_literal: true

def integral(eps = 1e-4)
  num = 1
  sum = 0
  while (1.0 / 3.0 - sum).abs > eps
    num *= 2
    d_x = 1.0 / num.to_f
    sum = (1...num).to_a.reduce(0) { |sum_l, cnt_i| sum_l + (d_x * (func(cnt_i * d_x) + func((cnt_i + 1) * d_x)) / 2) }
  end
  sum
end

def func(x_num)
  x_num * Math.sqrt(1.0 - x_num**2).to_f
end

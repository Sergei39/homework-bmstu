# frozen_string_literal: true

def integral(eps = 1e-4)
  n = 1
  sum = 0
  while (1.0 / 3.0 - sum).abs > eps
    n *= 2
    d_x = 1.0 / n.to_f
    sum = (1...n).to_a.reduce(0) { |sum_l, i| sum_l + (d_x * (func(i * d_x) + func((i + 1) * d_x)) / 2) }
  end
  sum
end

def func(x_num)
  x_num * Math.sqrt(1.0 - x_num**2).to_f
end

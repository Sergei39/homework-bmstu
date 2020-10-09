# frozen_string_literal: true

def integral(eps = 1e-4)
  n = 1
  sum = 0
  while (1.0 / 3.0 - sum).abs > eps
    n *= 2
    sum = 0
    d_x = 1.0 / n.to_f
    (n - 1).times do |i|
      sum += d_x * (func(i * d_x) + func((i + 1) * d_x)) / 2
    end
  end
  n
end

def func(x)
  x * Math.sqrt(1.0 - x**2).to_f
end

# frozen_string_literal: true

def integral(eps = 1e-4)
  list.find { |sum| (1.0 / 3.0 - sum).abs < eps }

end

def getIntegral(counter, d_x)
  (1...counter).to_a.reduce(0) { |sum_l, i| sum_l + (d_x * (func(i * d_x) + func((i + 1) * d_x)) / 2) }
end

def list
  Enumerator.new do |yielder|
    sum = 0.0
    counter = 1
    loop do
      yielder.yield sum
      d_x = 1.0 / counter.to_f
      sum = getIntegral(counter, d_x)
      counter *= 2
    end
  end
end

def func(x_num)
  x_num * Math.sqrt(1.0 - x_num**2).to_f
end

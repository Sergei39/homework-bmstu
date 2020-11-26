# frozen_string_literal: true

def integral(step, top, bottom, function = false)
  square = 0
  d_x = (top - bottom) / step.to_f
  (bottom..top).step(d_x) { |cur_pos| square += function ? function.call(cur_pos) : yield(cur_pos) }
  square * d_x
end

# Multiple assignment, swapping and splat destructuring.
a, b = 1, 2
a, b = b, a
puts "a=#{a} b=#{b}"

first, *rest = [10, 20, 30, 40]
puts first
p rest

def min_max(values : Array(Int32)) : Tuple(Int32, Int32)
  {values.min, values.max}
end

lo, hi = min_max([4, 9, 2, 7])
puts "lo=#{lo} hi=#{hi}"

(x, y), z = {1, 2}, 3
puts x + y + z

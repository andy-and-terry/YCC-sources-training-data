def min_max(values : Array(Int32)) : Tuple(Int32, Int32)
  {values.min, values.max}
end

low, high = min_max([7, 3, 9, 1, 5])
puts "low=#{low} high=#{high}"

first, *rest = [1, 2, 3, 4]
puts first
puts rest.inspect

a, b = 1, 2
a, b = b, a
puts "a=#{a} b=#{b}"

pairs = [{"x", 1}, {"y", 2}]
pairs.each do |(name, value)|
  puts "#{name} -> #{value}"
end

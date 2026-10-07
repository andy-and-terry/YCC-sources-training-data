def min_max(values : Array(Int32)) : Tuple(Int32, Int32)
  {values.min, values.max}
end

low, high = min_max([5, 3, 9, 1, 7])
puts "low=#{low} high=#{high}"

first, *rest = [1, 2, 3, 4]
puts first
puts rest

a, b = 1, 2
a, b = b, a
puts "a=#{a} b=#{b}"

pairs = {"x" => 1, "y" => 2}
pairs.each do |key, value|
  puts "#{key} => #{value}"
end

[{1, "one"}, {2, "two"}].each do |(num, name)|
  puts "#{num}: #{name}"
end

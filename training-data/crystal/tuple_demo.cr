def min_max(values : Array(Int32)) : Tuple(Int32, Int32)
  {values.min, values.max}
end

low, high = min_max([7, 3, 9, 1, 5])
puts "low=#{low} high=#{high}"

point = {3, 4}
puts point[0] + point[1]
puts point.size
puts point.map { |c| c * 2 }.inspect
puts point.class

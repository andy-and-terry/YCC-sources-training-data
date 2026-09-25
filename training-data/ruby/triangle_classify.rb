def classify(*sides)
  a, b, c = sides.sort
  return :invalid if a <= 0 || a + b <= c

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

[[3, 3, 3], [3, 4, 4], [3, 4, 5], [1, 1, 3]].each { |t| puts "#{t.inspect} #{classify(*t)}" }

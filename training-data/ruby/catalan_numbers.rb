def catalan(n)
  c = [1]
  (1..n).each { |i| c << (0...i).sum { |j| c[j] * c[i - 1 - j] } }
  c
end

def binomial(n, k) = (1..k).reduce(1) { |acc, i| acc * (n - k + i) / i }

def triangulations(polygon)
  return [[]] if polygon.size < 3

  a, b = polygon.first, polygon.last
  (1...polygon.size - 1).flat_map do |k|
    left = triangulations(polygon[0..k])
    right = triangulations(polygon[k..])
    left.product(right).map { |l, r| [[a, polygon[k], b], *l, *r] }
  end
end

c = catalan(40)
puts "C(10) = #{c[10]}, C(40) = #{c[40]}"
puts "closed form agrees: #{c.each_with_index.all? { |v, i| v == binomial(2 * i, i) / (i + 1) }}"
puts "hexagon triangulations: #{triangulations((0...6).to_a).size} (C(4) = #{c[4]})"

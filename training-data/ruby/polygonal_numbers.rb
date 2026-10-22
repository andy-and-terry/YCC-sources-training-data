# n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2
def polygonal(s, n)
  ((s - 2) * n * n - (s - 4) * n) / 2
end

{ "triangular" => 3, "pentagonal" => 5, "hexagonal" => 6 }.each do |name, s|
  puts "#{name}: #{(1..10).map { |n| polygonal(s, n) }.join(' ')}"
end

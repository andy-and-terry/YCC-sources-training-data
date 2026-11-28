n = 50
composite = Array.new(n + 1, false)
(2..Math.isqrt(n)).each do |i|
  next if composite[i]
  (i * i).step(to: n, by: i) { |j| composite[j] = true }
end
(3..n - 2).each do |p|
  print "(#{p}, #{p + 2}) " unless composite[p] || composite[p + 2]
end
puts

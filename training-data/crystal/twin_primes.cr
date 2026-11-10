limit = 80
composite = Array.new(limit + 1, false)
(2..Math.isqrt(limit)).each do |i|
  next if composite[i]
  (i * i).step(to: limit, by: i) { |j| composite[j] = true }
end
pairs = (3..limit - 2).select { |p| !composite[p] && !composite[p + 2] }.map { |p| "(#{p},#{p + 2})" }
puts pairs.join(" ") # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)

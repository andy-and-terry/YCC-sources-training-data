LIMIT = 100_000
sums = Array.new(LIMIT + 1, 0)
(1..LIMIT / 2).each { |d| (2 * d).step(LIMIT, d) { |m| sums[m] += d } }

classify = lambda do |n|
  case sums[n] <=> n
  when 0 then :perfect
  when 1 then :abundant
  else :deficient
  end
end

puts "perfect: #{(2..LIMIT).select { |n| sums[n] == n }.inspect}"
p (2..LIMIT).map(&classify).tally
amicable = (2..LIMIT).filter_map { |a| b = sums[a]; [a, b] if b > a && b <= LIMIT && sums[b] == a }
p amicable.first(5)

def count_primes_below(n : Int32) : Int32
  return 0 if n < 3
  composite = Array.new(n, false)
  count = 0
  (2...n).each do |i|
    next if composite[i]
    count += 1
    (i * i).step(to: n - 1, by: i) { |j| composite[j] = true }
  end
  count
end

puts count_primes_below(100)

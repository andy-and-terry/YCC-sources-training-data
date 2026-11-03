def count_primes_below(n)
  return 0 if n < 3
  sieve = Array.new(n, true)
  sieve[0] = sieve[1] = false
  (2...n).each do |i|
    next unless sieve[i]
    (i * i).step(n - 1, i) { |j| sieve[j] = false }
  end
  sieve.count(true)
end

puts count_primes_below(100)

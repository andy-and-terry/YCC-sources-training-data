def sieve(limit)
  is_prime = Array.new(limit + 1, true)
  is_prime[0] = is_prime[1] = false
  (2..Math.sqrt(limit)).each do |n|
    next unless is_prime[n]
    (n * n).step(limit, n) { |m| is_prime[m] = false }
  end
  (0..limit).select { |n| is_prime[n] }
end

puts sieve(50).inspect

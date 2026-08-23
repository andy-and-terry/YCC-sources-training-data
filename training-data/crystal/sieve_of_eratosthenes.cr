def sieve(limit : Int32) : Array(Int32)
  is_prime = Array.new(limit + 1, true)
  is_prime[0] = false
  is_prime[1] = false if limit >= 1
  n = 2
  while n * n <= limit
    if is_prime[n]
      multiple = n * n
      while multiple <= limit
        is_prime[multiple] = false
        multiple += n
      end
    end
    n += 1
  end
  (0..limit).select { |i| is_prime[i] }.to_a
end

puts sieve(50).inspect

def prime_factor_count(n : Int32) : Int32
  count = 0
  p = 2
  while p * p <= n
    while n % p == 0
      n //= p
      count += 1
    end
    p += 1
  end
  n > 1 ? count + 1 : count
end

puts (2...30).select { |n| prime_factor_count(n) == 2 }.inspect

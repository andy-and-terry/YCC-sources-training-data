def prime_factors(n)
  factors = []
  d = 2
  while d * d <= n
    if n % d == 0
      exponent = 0
      while n % d == 0
        n /= d
        exponent += 1
      end
      factors << [d, exponent]
    end
    d += d == 2 ? 1 : 2
  end
  factors << [n, 1] if n > 1
  factors
end

puts prime_factors(360).inspect
puts prime_factors(97).inspect
puts prime_factors(1).inspect

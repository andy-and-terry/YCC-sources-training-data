require 'prime'

def factorize(n)
  factors = Hash.new(0)
  d = 2
  while d * d <= n
    while (n % d).zero?
      factors[d] += 1
      n /= d
    end
    d += d == 2 ? 1 : 2
  end
  factors[n] += 1 if n > 1
  factors
end

def format_factors(f) = f.map { |p, e| e > 1 ? "#{p}^#{e}" : p.to_s }.join(' * ')

[360, 97, 1001, 82_944, 600_851_475_143].each do |n|
  mine = factorize(n)
  stdlib = n.prime_division.to_h
  puts "#{n} = #{format_factors(mine)} (matches Prime: #{mine == stdlib})"
end

require 'prime'

def phi(n) = n.prime_division.reduce(n) { |acc, (p, _)| acc / p * (p - 1) }

def phi_sieve(limit)
  t = (0..limit).to_a
  (2..limit).each do |i|
    next unless t[i] == i

    i.step(limit, i) { |j| t[j] -= t[j] / i }
  end
  t
end

t = phi_sieve(100_000)
p t[1..20]
puts "sieve agrees with prime_division: #{(1..2000).all? { |n| t[n] == phi(n) }}"
puts "phi(10^12) = #{phi(10**12)}, sum phi(2..1e5) = #{t[2..].sum}"

def pow_mod(base, exp, mod)
  result = 1 % mod
  base %= mod
  while exp.positive?
    result = result * base % mod if exp.odd?
    base = base * base % mod
    exp >>= 1
  end
  result
end

puts pow_mod(2, 10, 1000), pow_mod(3, 200, 13), pow_mod(7, 10**18, 1_000_000_007)
big_p = 2**127 - 1
puts "Fermat check on 2^127-1: #{pow_mod(3, big_p - 1, big_p) == 1} (Integer#pow agrees: #{3.pow(big_p - 1, big_p) == 1})"

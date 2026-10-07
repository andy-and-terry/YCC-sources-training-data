def mod_pow(base, exp, mod)
  result = 1
  base %= mod
  while exp > 0
    result = result * base % mod if exp.odd?
    base = base * base % mod
    exp >>= 1
  end
  result
end

puts mod_pow(2, 10, 1000)
puts mod_pow(3, 200, 13)
puts 3.pow(200, 13)
puts mod_pow(7, 10**18, 10**9 + 7)

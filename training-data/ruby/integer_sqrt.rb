def isqrt(n)
  raise ArgumentError, 'negative' if n.negative?
  return n if n < 2

  x = n
  y = (x + 1) / 2
  while y < x
    x = y
    y = (x + n / x) / 2
  end
  x
end

[0, 1, 15, 16, 17, 10**40 + 12_345, 2**127].each do |n|
  r = isqrt(n)
  raise "bad #{n}" unless r == Integer.sqrt(n)

  puts "isqrt(#{n}) = #{r}"
end

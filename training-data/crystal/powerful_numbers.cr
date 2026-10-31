def powerful?(n : Int32) : Bool
  p = 2
  while p * p <= n
    if n % p == 0
      return false unless n % (p * p) == 0
      n //= p while n % p == 0
    end
    p += 1
  end
  n == 1
end

puts (1..100).select { |n| powerful?(n) }.join(" ")

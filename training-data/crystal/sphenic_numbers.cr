def sphenic?(n : Int32) : Bool
  distinct = 0
  p = 2
  while p * p <= n
    if n % p == 0
      n //= p
      return false if n % p == 0
      distinct += 1
    end
    p += 1
  end
  distinct + (n > 1 ? 1 : 0) == 3
end

puts (2...80).select { |n| sphenic?(n) }.inspect

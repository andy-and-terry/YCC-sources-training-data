def prime?(n : Int64) : Bool
  return false if n < 2
  i = 2_i64
  while i * i <= n
    return false if n % i == 0
    i += 1
  end
  true
end

found = [] of Int64
p = 2_i64
while found.size < 10
  found << p if prime?(p) && prime?(2 * p + 1)
  p += 1
end
puts found.join(" ") # 2 3 5 11 23 29 41 53 83 89

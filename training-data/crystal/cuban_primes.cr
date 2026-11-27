def prime?(n : Int64) : Bool
  return false if n < 2
  i = 2_i64
  while i * i <= n
    return false if n % i == 0
    i += 1
  end
  true
end

out = [] of Int64
y = 1_i64
while out.size < 8
  p = 3 * y * y + 3 * y + 1
  out << p if prime?(p)
  y += 1
end
puts out

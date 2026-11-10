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
n = 2_i64
while out.size < 10
  r = n.to_s.reverse.to_i64
  out << n if r != n && prime?(n) && prime?(r)
  n += 1
end
puts out.join(" ") # 13 17 31 37 71 73 79 97 107 113

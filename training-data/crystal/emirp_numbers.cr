def prime?(n : Int32) : Bool
  return false if n < 2
  i = 2
  while i * i <= n
    return false if n % i == 0
    i += 1
  end
  true
end

emirps = (2...200).select do |p|
  r = p.to_s.reverse.to_i
  r != p && prime?(p) && prime?(r)
end
puts emirps.join(" ") # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199

def prime?(n : Int32) : Bool
  return false if n < 2
  i = 2
  while i * i <= n
    return false if n % i == 0
    i += 1
  end
  true
end

result = (2...200).select { |n| n.to_s == n.to_s.reverse && prime?(n) }
puts result.join(" ") # 2 3 5 7 11 101 131 151 181 191

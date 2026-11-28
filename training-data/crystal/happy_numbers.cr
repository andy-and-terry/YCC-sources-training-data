def happy?(n : Int32) : Bool
  seen = Set(Int32).new
  while n != 1 && seen.add?(n)
    n = n.digits.sum { |d| d * d }
  end
  n == 1
end

found = [] of Int32
n = 1
while found.size < 8
  found << n if happy?(n)
  n += 1
end
puts found.join(" ") # 1 7 10 13 19 23 28 31
